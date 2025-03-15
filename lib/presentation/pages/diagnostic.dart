import 'package:auth_models/auth_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DiagnosticDashboardScreen extends StatefulWidget {
  const DiagnosticDashboardScreen({super.key});

  @override
  State<DiagnosticDashboardScreen> createState() =>
      _DiagnosticDashboardScreenState();
}

class _DiagnosticDashboardScreenState extends State<DiagnosticDashboardScreen> {
  UserModel? currentUser;
  String? authToken;
  String statusMessage = "Verificando autenticación...";
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    if (!mounted) return; // Verificar si el widget todavía está montado

    setState(() {
      isLoading = true;
      statusMessage = "Verificando autenticación...";
      hasError = false;
    });

    try {
      final authRepository = FirebaseAuthRepository();
      final authService = AuthService(authRepository);

      final authModel = await authService.checkAuthStatus();

      if (!mounted) {
        return; // Verificar nuevamente después de operación asíncrona
      }

      if (authModel.isAuthenticated && authModel.user != null) {
        setState(() {
          currentUser = authModel.user;
          authToken = authModel.token;
          statusMessage = "Autenticación exitosa";
          isLoading = false;
        });
      } else if (authModel.status == AuthStatus.error) {
        setState(() {
          statusMessage = "Error: ${authModel.errorMessage ?? 'Desconocido'}";
          hasError = true;
          isLoading = false;
        });
      } else {
        setState(() {
          statusMessage = "No autenticado";
          hasError = true;
          isLoading = false;
        });

        // Proteger la navegación si el widget sigue montado
        if (mounted) {
          Future.delayed(Duration(seconds: 2), () {
            if (mounted) Navigator.of(context).pushReplacementNamed('/login');
          });
        }
      }
    } catch (e) {
      if (!mounted) return;

      setState(() {
        statusMessage = "Error inesperado: $e";
        hasError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard de Diagnóstico'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _checkAuthStatus,
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              final authRepository = FirebaseAuthRepository();
              final authService = AuthService(authRepository);
              await authService.signOut();
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : hasError
              ? _buildErrorView()
              : _buildUserInfoView(),
    );
  }

  Widget _buildErrorView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, color: Colors.red, size: 48),
            SizedBox(height: 16),
            Text(
              'Error de Autenticación',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              statusMessage,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _checkAuthStatus,
              child: Text('Reintentar'),
            ),
            SizedBox(height: 12),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/login');
              },
              child: Text('Ir a Login'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfoView() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Información de Usuario',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  _buildUserInfoRow('ID', currentUser?.id ?? 'No disponible'),
                  _buildUserInfoRow(
                      'Email', currentUser?.email ?? 'No disponible'),
                  _buildUserInfoRow('Nombre',
                      '${currentUser?.nombre ?? ''} ${currentUser?.apellido ?? ''}'),
                  _buildUserInfoRow(
                      'Teléfono', currentUser?.telefono ?? 'No disponible'),
                  _buildUserInfoRow(
                      'CURP', currentUser?.curp ?? 'No disponible'),
                  _buildUserInfoRow(
                      'Escuela', currentUser?.escuela ?? 'No disponible'),
                  _buildUserInfoRow(
                      'Grado', currentUser?.grado ?? 'No disponible'),
                  _buildUserInfoRow('Rol', currentUser?.rol ?? 'No disponible'),
                  _buildUserInfoRow('Verificado',
                      currentUser?.isEmailVerified == true ? 'Sí' : 'No'),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Información de Autenticación',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  _buildUserInfoRow('Estado', statusMessage),
                  _buildUserInfoRow('Token', _formatToken(authToken)),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Diagnóstico de Firebase',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: _testFirestoreConnection,
                    child: Text('Probar conexión a Firestore'),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: _testFirestorePermissions,
                    child: Text('Probar permisos de Firestore'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  String _formatToken(String? token) {
    if (token == null || token.isEmpty) return 'No disponible';
    if (token.length <= 20) return token;
    return '${token.substring(0, 20)}...';
  }

  Future<void> _testFirestoreConnection() async {
    try {
      setState(() {
        statusMessage = "Probando conexión a Firestore...";
        isLoading = true;
      });

      // Intenta una operación simple de Firestore
      final result =
          await FirebaseFirestore.instance.collection('test').doc('test').get();

      setState(() {
        statusMessage = "Conexión a Firestore exitosa";
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Conexión a Firestore exitosa')));
    } catch (e) {
      setState(() {
        statusMessage = "Error de conexión a Firestore: $e";
        isLoading = false;
        hasError = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red));
    }
  }

  Future<void> _testFirestorePermissions() async {
    try {
      setState(() {
        statusMessage = "Probando permisos de Firestore...";
        isLoading = true;
      });

      // Intenta leer el documento del usuario actual
      if (currentUser != null) {
        final result = await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser!.id)
            .get();

        if (result.exists) {
          setState(() {
            statusMessage = "Permisos de lectura correctos";
            isLoading = false;
          });

          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Permisos de lectura correctos')));
        } else {
          setState(() {
            statusMessage = "Documento de usuario no encontrado";
            isLoading = false;
          });

          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Documento de usuario no encontrado')));
        }
      } else {
        setState(() {
          statusMessage = "No hay usuario autenticado";
          isLoading = false;
          hasError = true;
        });
      }
    } catch (e) {
      setState(() {
        statusMessage = "Error de permisos: $e";
        isLoading = false;
        hasError = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error de permisos: $e'), backgroundColor: Colors.red));
    }
  }
}
