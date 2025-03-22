// lib/main.dart (versión integrada)
import 'package:auth_models/auth_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erelis/data/datasources/firebase/categories_firebase_datasource.dart';
import 'package:erelis/data/datasources/firebase/courses_firebase_datasource.dart';
import 'package:erelis/data/repositories/categories_repository_impl.dart';
import 'package:erelis/data/repositories/courses_repository_impl.dart';
import 'package:erelis/features/questions/domain/repositories/question_repository.dart';
import 'package:erelis/features/questions/presentation/test/test_bloc.dart';
import 'package:erelis/features/salon/domain/repositories/subjects_repository.dart';
import 'package:erelis/features/salon/presentation/bloc/salon_bloc.dart';

import 'package:erelis/features/tablero/domain/repositories/tablero_repository.dart';
import 'package:erelis/features/tablero/domain/usecases/get_course_progress_usecase.dart';
import 'package:erelis/features/tablero/domain/usecases/get_exams_usecase.dart';
import 'package:erelis/features/tablero/domain/usecases/get_leaders_usecase.dart';
import 'package:erelis/features/tablero/domain/usecases/get_user_profile_usecase.dart';
import 'package:erelis/features/tablero/domain/usecases/update_course_progress_usecase.dart';
import 'package:erelis/features/unidad/data/datasources/highlight_remote_data_source.dart';
import 'package:erelis/features/unidad/data/datasources/unit_remote_data_source.dart';
import 'package:erelis/features/unidad/data/repositories/highlight_repository_impl.dart';
import 'package:erelis/features/unidad/data/repositories/unit_repository_impl.dart';
import 'package:erelis/features/unidad/domain/repositories/highlight_repository.dart';
import 'package:erelis/features/unidad/domain/repositories/unit_repository.dart';
import 'package:erelis/features/unidad/presentation/blocs/unit_detail/unit_detail_bloc.dart';
import 'package:erelis/features/unidad/presentation/blocs/units/units_bloc.dart';

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

  MyApp({
    super.key,
    required this.authService,
  });
  final SubjectsRepository subjectRepository = SubjectsRepository();

  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
        providers: [
          // Repositorios existentes
          RepositoryProvider(create: (context) => subjectRepository),
          // Nuevos repositorios para unidades

          RepositoryProvider<HighlightRepository>(
            create: (context) => HighlightRepositoryImpl(
              remoteDataSource: HighlightRemoteDataSource(
                firestore: FirebaseFirestore.instance,
              ),
            ),
          ),
          RepositoryProvider<UnitsRemoteDataSource>(
            create: (context) => UnitsRemoteDataSourceImpl(
              firestore: FirebaseFirestore.instance,
            ),
          ),
          RepositoryProvider<UnitsRepository>(
            create: (context) => UnitsRepositoryImpl(
              remoteDataSource: context.read<UnitsRemoteDataSource>(),
            ),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            // BLoCs existentes
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
                return TableroBloc(
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
            BlocProvider<SalonBloc>(
                create: (context) => SalonBloc(
                      subjectsRepository: subjectRepository,
                    )),
            BlocProvider<UnitsBloc>(
              create: (context) => UnitsBloc(
                repository: context.read<UnitsRepository>(),
              ),
            ),
            BlocProvider<UnitDetailBloc>(
              create: (context) => UnitDetailBloc(
                repository: context.read<UnitsRepository>(),
              ),
            ),
            BlocProvider<TestBloc>(
              create: (context) => TestBloc(
                questionRepository: context.read(),
                resultRepository: context.read(),
              ),
            ),
            // Nuevos BLoCs para unidades

            // El UnitContentBloc no se crea aquí, se creará en la página de contenido
            // cuando sea necesario para evitar cargas innecesarias
          ],
          child: MaterialApp(
            navigatorKey: navigationService.navigatorKey,
            title: 'Erelis - Plataforma Educativa',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.darkTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.light,

            initialRoute: '/initial',
            onGenerateRoute: AppRoutes
                .onGenerateRoute, // Usar onGenerateRoute en vez de routes
          ),
        ),
      );
}
