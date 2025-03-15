import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erelis/features/tablero/domain/repositories/tablero_repository_impl.dart';
import 'package:erelis/presentation/blocs/tablero/tablero_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import 'package:erelis/features/tablero/domain/repositories/tablero_repository.dart';
import 'package:erelis/features/tablero/domain/usecases/get_course_progress_usecase.dart';
import 'package:erelis/features/tablero/domain/usecases/get_exams_usecase.dart';
import 'package:erelis/features/tablero/domain/usecases/get_leaders_usecase.dart';
import 'package:erelis/features/tablero/domain/usecases/get_user_profile_usecase.dart';
import 'package:erelis/features/tablero/domain/usecases/update_course_progress_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Register Firestore and Auth
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // Feature: Tablero
  // BLoC
  sl.registerFactory(() => TableroBloc(
        getLeadersUseCase: sl(),
        getCourseProgressUseCase: sl(),
        getExamsUseCase: sl(),
        getUserProfileUseCase: sl(),
        updateCourseProgressUseCase: sl(),
      ));

  // UseCases
  sl.registerLazySingleton(() => GetLeadersUseCase(sl()));
  sl.registerLazySingleton(() => GetCourseProgressUseCase(sl()));
  sl.registerLazySingleton(() => GetExamsUseCase(sl()));
  sl.registerLazySingleton(() => GetUserProfileUseCase(sl()));
  sl.registerLazySingleton(() => UpdateCourseProgressUseCase(sl()));

  // Repository
  sl.registerLazySingleton<TableroRepository>(
    () => TableroRepositoryImpl(
      firestore: sl(),
      auth: sl(),
    ),
  );
}
