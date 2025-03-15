import 'package:auth_models/auth_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erelis/data/datasources/firebase/categories_firebase_datasource.dart';
import 'package:erelis/data/datasources/firebase/courses_firebase_datasource.dart';
import 'package:erelis/data/repositories/categories_repository_impl.dart';
import 'package:erelis/data/repositories/courses_repository_impl.dart';
import 'package:erelis/features/salon/data/datasources/subjects_firebase_datasource.dart';
import 'package:erelis/features/salon/domain/repositories/subjects_repository.dart';
import 'package:erelis/features/salon/domain/repositories/subjects_repository_impl.dart';
import 'package:erelis/features/tablero/domain/repositories/tablero_repository.dart';
import 'package:erelis/features/tablero/domain/usecases/get_course_progress_usecase.dart';
import 'package:erelis/features/tablero/domain/usecases/get_exams_usecase.dart';
import 'package:erelis/features/tablero/domain/usecases/get_leaders_usecase.dart';
import 'package:erelis/features/tablero/domain/usecases/get_user_profile_usecase.dart';
import 'package:erelis/features/tablero/domain/usecases/update_course_progress_usecase.dart';
import 'package:erelis/presentation/blocs/auth/auth_bloc.dart';
import 'package:erelis/presentation/blocs/category/category_bloc.dart';
import 'package:erelis/presentation/blocs/category/category_event.dart';
import 'package:erelis/presentation/blocs/courses/courses_bloc.dart';
import 'package:erelis/presentation/blocs/courses/courses_event.dart';
import 'package:erelis/presentation/blocs/tablero/tablero_bloc.dart';
import 'package:erelis/services/navigation_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:erelis/config/app_theme.dart';
import 'package:erelis/presentation/blocs/navigation/navigation_bloc.dart';
import 'firebase_options.dart';
import 'package:erelis/config/routes.dart';

// Clave global para navegación

// Servicio para manejar errores de navegación

// lib/main.dart (versión corregida)
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicialización de Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Configuración de servicios
  if (kIsWeb) {
    await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
  }

  final authRepository = FirebaseAuthRepository();
  final authService = AuthService(authRepository);

  runApp(MyApp(authService: authService));
}

class MyApp extends StatelessWidget {
  final AuthService authService;

  const MyApp({
    super.key,
    required this.authService,
  });

  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
        providers: [
          // Aquí van TODOS los repositorios
          RepositoryProvider<SubjectsRepository>(
            create: (context) => SubjectsRepositoryImpl(
              remoteDataSource: SubjectsFirebaseDataSource(
                firestore: FirebaseFirestore.instance,
              ),
            ),
          ),
          // Otros repositorios...
        ],
        child: MultiBlocProvider(
          providers: [
            // Aquí van TODOS los BLoCs
            BlocProvider<NavigationBloc>(
              create: (context) => NavigationBloc(),
            ),
            BlocProvider<CoursesBloc>(
              create: (context) => CoursesBloc(
                coursesRepository: CoursesRepositoryImpl(
                  remoteDataSource: CoursesFirebaseDataSource(),
                ),
              )..add(FetchCourses()),
            ),

            BlocProvider<CategoryBloc>(
              create: (context) => CategoryBloc(
                categoriesRepository: CategoriesRepositoryImpl(
                  remoteDataSource: CategoriesFirebaseDataSource(),
                ),
              )..add(FetchCategories()),
            ),

            BlocProvider<AuthBloc>(
              create: (context) => AuthBloc(authService: authService)
                ..add(const AuthEvent.checkAuthStatus()),
            ),
            BlocProvider<TableroBloc>(
              create: (context) {
                // Creamos el bloc usando el repositorio
                return TableroBloc(
                  // Aquí usamos el context.read para acceder a los repositorios ya proporcionados
                  getLeadersUseCase:
                      GetLeadersUseCase(context.read<TableroRepository>()),
                  getCourseProgressUseCase: GetCourseProgressUseCase(
                      context.read<TableroRepository>()),
                  getExamsUseCase:
                      GetExamsUseCase(context.read<TableroRepository>()),
                  getUserProfileUseCase:
                      GetUserProfileUseCase(context.read<TableroRepository>()),
                  updateCourseProgressUseCase: UpdateCourseProgressUseCase(
                      context.read<TableroRepository>()),
                );
              },
            ),
            // NO añadimos el SalonBloc aquí, ya que se crea en su propia pantalla
          ],
          child: MaterialApp(
            navigatorKey: navigationService.navigatorKey,
            title: 'Erelis - Plataforma Educativa',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.darkTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.light,
            initialRoute: '/initial',
            routes: AppRoutes.routes,
          ),
        ),
      );
}
