import 'dart:async';
import 'dart:io';
import '../models/auth_model.dart';
import '../models/user_model.dart';
import 'auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseAuthRepository implements AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final StreamController<AuthModel> _authController =
      StreamController<AuthModel>.broadcast();

  final CollectionReference _usersCollection = FirebaseFirestore.instance
      .collection('users');

  final FirebaseStorage _storage = FirebaseStorage.instance;

  FirebaseAuthRepository() {
    // Listen to Firebase Auth state changes
    _auth.authStateChanges().listen(_handleAuthStateChange);
  }

  @override
  Stream<AuthModel> get authStateChanges => _authController.stream;

  @override
  void notifyLoadingState() {
    _authController.add(const AuthModel(status: AuthStatus.loading));
  }

  // Handle Firebase Auth state changes and convert to our AuthModel
  Future<void> _handleAuthStateChange(User? firebaseUser) async {
    if (firebaseUser == null) {
      _authController.add(const AuthModel(status: AuthStatus.unauthenticated));
      return;
    }

    try {
      // Get the token
      final token = await firebaseUser.getIdToken();

      // Get additional user data from Firestore
      final userModel = await _getUserFromFirestore(firebaseUser);

      // Notify authenticated state
      _authController.add(AuthModel.authenticated(userModel, token!));
    } catch (e) {
      _authController.add(AuthModel.error(_getReadableErrorMessage(e)));
    }
  }

  // Get user data from Firestore
  Future<UserModel> _getUserFromFirestore(User firebaseUser) async {
    try {
      final docSnapshot = await _usersCollection.doc(firebaseUser.uid).get();
      // Verificación previa

      // Si existe el documento, actualizar los datos seguros con los de Firestore
      if (docSnapshot.exists) {
        final userData = docSnapshot.data() as Map<String, dynamic>;

        // Actualizar solo si los valores no son nulos
        return UserModel(
          id: firebaseUser.uid,
          email: firebaseUser.email!,
          nombre: userData['nombre'],
          apellido: userData['apellido'],
          telefono: userData['telefono'] ?? firebaseUser.phoneNumber,
          curp: userData['curp'],
          escuela: userData['escuela'] as String,
          grado: userData['grado'] as String,
          displayName: userData['displayName'] as String?,
          photoUrl: userData['photoUrl'] ?? firebaseUser.photoURL,
          isEmailVerified: firebaseUser.emailVerified,
          createdAt:
              userData['createdAt'] != null
                  ? (userData['createdAt'] as Timestamp).toDate()
                  : null,
          lastLoginAt:
              userData['lastLoginAt'] != null
                  ? (userData['lastLoginAt'] as Timestamp).toDate()
                  : DateTime.now(),
          rol: userData['rol'] as String,
        );
      } else {
        // User doesn't exist in Firestore yet, create with basic info
        final newUser = UserModel(
          id: firebaseUser.uid,
          email: firebaseUser.email!,
          displayName: firebaseUser.displayName,
          photoUrl: firebaseUser.photoURL,
          isEmailVerified: firebaseUser.emailVerified,
          createdAt: DateTime.now(),
          lastLoginAt: DateTime.now(),
        );

        // Create user document in Firestore
        await _createUserInFirestore(newUser);

        return newUser;
      }

      // Debug para identificar campos problemáticos
    } catch (e, stackTrace) {
      print('Error detallado al obtener usuario de Firestore: $e');
      print('Stack trace: $stackTrace');

      // Crear un modelo de usuario básico en caso de error
      return UserModel(
        id: firebaseUser.uid,
        email: firebaseUser.email ?? '',
        nombre: '',
        apellido: '',
        telefono: '',
        curp: '',
        escuela: '',
        grado: '',
        displayName: '',
        photoUrl: null,
        isEmailVerified: false,
        createdAt: DateTime.now(),
        lastLoginAt: DateTime.now(),
      );
    }
  }

  // Crear un nuevo documento de usuario en Firestore
  Future<void> _createUserInFirestore(UserModel user) async {
    try {
      await _usersCollection.doc(user.id).set({
        'email': user.email,
        'nombre': user.nombre,
        'apellido': user.apellido,
        'telefono': user.telefono,
        'curp': user.curp,
        'escuela': user.escuela,
        'grado': user.grado,
        'displayName': user.displayName,
        'photoUrl': user.photoUrl,
        'isEmailVerified': user.isEmailVerified,
        'rol': user.rol,

        'createdAt': FieldValue.serverTimestamp(),
        'lastLoginAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error creating user in Firestore: ${e.toString()}');
    }
  }

  // Update lastLogin timestamp in Firestore
  Future<void> _updateLastLogin(String userId) async {
    try {
      await _usersCollection.doc(userId).update({
        'lastLoginAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error updating last login: ${e.toString()}');
    }
  }

  // Subir foto de perfil a Firebase Storage
  Future<String?> _uploadProfilePhoto(File photoFile, String userId) async {
    try {
      final storageRef = _storage
          .ref()
          .child('profile_photos')
          .child('$userId.jpg');
      final uploadTask = storageRef.putFile(photoFile);
      final snapshot = await uploadTask;
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      print('Error uploading profile photo: ${e.toString()}');
      return null;
    }
  }

  @override
  Future<AuthModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      // Validation
      if (email.isEmpty) {
        return AuthModel.error('El email no puede estar vacío');
      }
      if (password.isEmpty) {
        return AuthModel.error('La contraseña no puede estar vacía');
      }

      // Notify loading state
      _authController.add(const AuthModel(status: AuthStatus.loading));

      // Attempt to sign in with Firebase Auth
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final firebaseUser = userCredential.user;
      if (firebaseUser == null) {
        return AuthModel.error('Error de autenticación');
      }

      // Get token
      final token = await firebaseUser.getIdToken();

      // Get user data from Firestore
      final userModel = await _getUserFromFirestore(firebaseUser);

      // Update last login timestamp
      await _updateLastLogin(firebaseUser.uid);

      // Create authenticated model
      final authModel = AuthModel.authenticated(userModel, token!);

      // No need to add to controller here as the authStateChanges() listener will do it
      return authModel;
    } on FirebaseAuthException catch (e) {
      final errorMessage = _getFirebaseAuthErrorMessage(e);
      final errorModel = AuthModel.error(errorMessage);
      _authController.add(errorModel);
      return errorModel;
    } catch (e) {
      final errorMessage = _getReadableErrorMessage(e);
      final errorModel = AuthModel.error(errorMessage);
      _authController.add(errorModel);
      return errorModel;
    }
  }

  @override
  Future<AuthModel> signUp({
    required String email,
    required String password,
    String? displayName,
    required String nombre,
    required String apellido,
    required String telefono,
    required String curp,
    required String escuela,
    required String grado,
    File? foto,
  }) async {
    try {
      // Validation
      if (email.isEmpty) {
        return AuthModel.error('El email no puede estar vacío');
      }
      if (password.isEmpty) {
        return AuthModel.error('La contraseña no puede estar vacía');
      }
      if (password.length < 6) {
        return AuthModel.error(
          'La contraseña debe tener al menos 6 caracteres',
        );
      }

      // Notify loading state
      _authController.add(const AuthModel(status: AuthStatus.loading));

      // Create user with Firebase Auth
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final firebaseUser = userCredential.user;
      if (firebaseUser == null) {
        return AuthModel.error('Error al crear usuario');
      }

      // Update displayName if provided
      if (displayName != null && displayName.isNotEmpty) {
        await firebaseUser.updateDisplayName(displayName);
      }

      // Upload profile photo if provided
      String? photoUrl;
      if (foto != null) {
        photoUrl = await _uploadProfilePhoto(foto, firebaseUser.uid);

        if (photoUrl != null) {
          await firebaseUser.updatePhotoURL(photoUrl);
        }
      }

      // Get token
      final token = await firebaseUser.getIdToken();

      // Create UserModel with the provided data
      final userModel = UserModel(
        id: firebaseUser.uid,
        email: firebaseUser.email!,
        nombre: nombre,
        apellido: apellido,
        telefono: telefono,
        curp: curp,
        escuela: escuela,
        grado: grado,
        displayName: displayName ?? firebaseUser.displayName,
        photoUrl: photoUrl ?? firebaseUser.photoURL,
        isEmailVerified: firebaseUser.emailVerified,
        createdAt: DateTime.now(),
        lastLoginAt: DateTime.now(),
      );

      // Create user document in Firestore
      await _createUserInFirestore(userModel);

      // Create authenticated model
      final authModel = AuthModel.authenticated(userModel, token!);

      // No need to add to controller here as the authStateChanges() listener will do it
      return authModel;
    } on FirebaseAuthException catch (e) {
      final errorMessage = _getFirebaseAuthErrorMessage(e);
      final errorModel = AuthModel.error(errorMessage);
      _authController.add(errorModel);
      return errorModel;
    } catch (e) {
      final errorMessage = _getReadableErrorMessage(e);
      final errorModel = AuthModel.error(errorMessage);
      _authController.add(errorModel);
      return errorModel;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      // Notify loading state
      _authController.add(const AuthModel(status: AuthStatus.loading));

      // Sign out from Firebase Auth
      await _auth.signOut();

      // No need to add to controller here as the authStateChanges() listener will do it
    } catch (e) {
      _authController.add(AuthModel.error(_getReadableErrorMessage(e)));
    }
  }

  @override
  Future<AuthModel> getCurrentAuth() async {
    try {
      // Get current Firebase user
      final firebaseUser = _auth.currentUser;
      if (firebaseUser == null) {
        return const AuthModel(status: AuthStatus.unauthenticated);
      }

      // Get token
      final token = await firebaseUser.getIdToken();

      // Get user data from Firestore
      final userModel = await _getUserFromFirestore(firebaseUser);

      return AuthModel.authenticated(userModel, token!);
    } catch (e) {
      return AuthModel.error(_getReadableErrorMessage(e));
    }
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      // Get current Firebase user
      final firebaseUser = _auth.currentUser;
      if (firebaseUser == null) {
        return null;
      }

      // Get user data from Firestore
      return await _getUserFromFirestore(firebaseUser);
    } catch (e) {
      print('Error getting current user: ${e.toString()}');
      return null;
    }
  }

  @override
  Future<bool> updateUser(UserModel user) async {
    try {
      // Notify loading state
      _authController.add(const AuthModel(status: AuthStatus.loading));

      // Get current Firebase user
      final firebaseUser = _auth.currentUser;
      if (firebaseUser == null) {
        return false;
      }

      // Update display name if needed
      if (user.displayName != null &&
          user.displayName != firebaseUser.displayName) {
        await firebaseUser.updateDisplayName(user.displayName);
      }

      // Update photo URL if needed
      if (user.photoUrl != null && user.photoUrl != firebaseUser.photoURL) {
        await firebaseUser.updatePhotoURL(user.photoUrl);
      }

      // Update user data in Firestore including custom fields
      await _usersCollection.doc(user.id).update({
        'displayName': user.displayName,
        'photoUrl': user.photoUrl,
        'nombre': user.nombre,
        'apellido': user.apellido,
        'telefono': user.telefono,
        'curp': user.curp,
        'escuela': user.escuela,
        'grado': user.grado,
        'rol': user.rol,

        'lastUpdatedAt': FieldValue.serverTimestamp(),
      });

      // Get token
      final token = await firebaseUser.getIdToken(true); // Force refresh token

      // Create updated authenticated model
      final authModel = AuthModel.authenticated(user, token!);

      // Notify of update
      _authController.add(authModel);

      return true;
    } catch (e) {
      print('Error updating user: ${e.toString()}');
      _authController.add(AuthModel.error(_getReadableErrorMessage(e)));
      return false;
    }
  }

  @override
  Future<bool> resetPassword(String email) async {
    try {
      // Validation
      if (email.isEmpty) {
        _authController.add(AuthModel.error('El email no puede estar vacío'));
        return false;
      }

      // Notify loading state
      _authController.add(const AuthModel(status: AuthStatus.loading));

      // Send password reset email
      await _auth.sendPasswordResetEmail(email: email);

      return true;
    } on FirebaseAuthException catch (e) {
      final errorMessage = _getFirebaseAuthErrorMessage(e);
      _authController.add(AuthModel.error(errorMessage));
      return false;
    } catch (e) {
      print('Error sending reset email: ${e.toString()}');
      _authController.add(AuthModel.error(_getReadableErrorMessage(e)));
      return false;
    }
  }

  // Get user-friendly error message from FirebaseAuthException
  String _getFirebaseAuthErrorMessage(FirebaseAuthException exception) {
    switch (exception.code) {
      case 'user-not-found':
        return 'No existe una cuenta con este correo electrónico';
      case 'wrong-password':
        return 'La contraseña es incorrecta';
      case 'email-already-in-use':
        return 'Este correo electrónico ya está registrado';
      case 'weak-password':
        return 'La contraseña es demasiado débil';
      case 'invalid-email':
        return 'El formato del correo electrónico no es válido';
      case 'operation-not-allowed':
        return 'Operación no permitida. Contacta con soporte';
      case 'account-exists-with-different-credential':
        return 'Ya existe una cuenta con este email pero con otro método de inicio de sesión';
      case 'invalid-credential':
        return 'Credenciales inválidas';
      case 'user-disabled':
        return 'Esta cuenta ha sido deshabilitada';
      case 'too-many-requests':
        return 'Demasiados intentos fallidos. Intenta más tarde';
      case 'network-request-failed':
        return 'Error de conexión. Por favor, verifica tu internet';
      default:
        return 'Error: ${exception.message ?? exception.code}';
    }
  }

  // Helper method to convert exceptions to user-friendly messages
  String _getReadableErrorMessage(dynamic error) {
    if (error is FirebaseAuthException) {
      return _getFirebaseAuthErrorMessage(error);
    }

    final errorString = error.toString().toLowerCase();
    if (errorString.contains('network')) {
      return 'Error de conexión. Por favor, verifica tu internet';
    }

    return 'Error inesperado: ${error.toString()}';
  }

  // Ensure proper disposal of resources
  @override
  void dispose() {
    _authController.close();
  }
}
