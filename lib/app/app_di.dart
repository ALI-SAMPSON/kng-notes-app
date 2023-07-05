import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:note_taking_app/data/remote/data_sources/auth_data_source/auth_data_source.dart';
import 'package:note_taking_app/data/remote/data_sources/auth_data_source/auth_data_source_impl.dart';
import 'package:note_taking_app/data/remote/data_sources/note_data_source/note_data_source.dart';
import 'package:note_taking_app/data/remote/data_sources/note_data_source/note_data_source_impl.dart';
import 'package:note_taking_app/data/remote/repository/auth_repository/auth_repository.dart';
import 'package:note_taking_app/data/remote/repository/auth_repository/auth_repository_impl.dart';
import 'package:note_taking_app/data/remote/repository/note_repository/note_repository.dart';
import 'package:note_taking_app/data/remote/repository/note_repository/note_repository_impl.dart';
import 'package:note_taking_app/data/remote/services/auth_service/auth_service.dart';
import 'package:note_taking_app/data/remote/services/auth_service/auth_service_impl.dart';
import 'package:note_taking_app/data/remote/services/note_service/note_service.dart';
import 'package:note_taking_app/data/remote/services/note_service/note_service_impl.dart';
import 'package:note_taking_app/data/remote/wrappers/catch_error_wrapper.dart';
import 'package:note_taking_app/data/remote/wrappers/network_call_wrapper.dart';
import 'package:note_taking_app/data/remote/wrappers/network_info.dart';
import 'package:note_taking_app/presentation/features/note/view_model/note_view_model.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // initialize all app dependencies (dependency injection)
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // instance of all data sources
  instance.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl());
  instance.registerLazySingleton<NoteDataSource>(() => NoteDataSourceImpl());

  // instance of all repositories
  instance.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  instance.registerLazySingleton<NoteRepository>(() => NoteRepositoryImpl());

  // instance of all services
  instance.registerLazySingleton<AuthService>(() => AuthServiceImpl());
  instance.registerLazySingleton<NoteService>(() => NoteServiceImpl());

  // instance of wrappers
  instance.registerLazySingleton<AsyncNetworkWrapper>(
      () => AsyncNetworkWrapperImpl(instance()));
  instance.registerLazySingleton<CatchApiErrorWrapper>(
      () => CatchApiErrorWrapperImpl());

  // instances of view models
  instance.registerLazySingleton<NoteViewModel>(() => NoteViewModel());
}
