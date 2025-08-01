import 'dart:io';
import 'package:bloc_demo_project/core/network/connection_checker.dart';
import 'package:bloc_demo_project/feature/login/data/datasources/login_remote_datasource.dart';
import 'package:bloc_demo_project/feature/login/data/datasources/login_remote_datasource_impl.dart';
import 'package:bloc_demo_project/feature/login/data/repositories/login_repository_impl.dart';
import 'package:bloc_demo_project/feature/login/domain/repositories/login_repository.dart';
import 'package:bloc_demo_project/feature/login/domain/usecases/login_user.dart';
import 'package:bloc_demo_project/feature/login/presentation/bloc/login_bloc.dart';
import 'package:bloc_demo_project/feature/products/data/data_sources/product_remote_data_source.dart'
    show ProductsRemoteDataSource;
import 'package:bloc_demo_project/feature/products/data/data_sources/product_remote_data_source_imp.dart'
    show ProductsRemoteDataSourceImp;
import 'package:bloc_demo_project/feature/products/data/repositories_imp/product_repository_impl.dart'
    show ProductsRepositoryImpl;
import 'package:bloc_demo_project/feature/products/domain/repositories/product_repository.dart'
    show ProductsRepository;
import 'package:bloc_demo_project/feature/products/domain/use_cases/product_use_cases.dart'
    show ProductsUseCase;
import 'package:bloc_demo_project/feature/products/presentation/bloc/products_bloc.dart'
    show ProductsBloc;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'core/network/api_helper.dart' show ApiHelper;
import 'core/network/dio_client.dart' show DioClient;

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  _registerLocalStorage();
  _registerLocalization();
  _registerNetworking();
  _initAuth();
  _initProducts();
}

// Localization
void _registerLocalization() {
  getIt.registerSingleton<FlutterLocalization>(FlutterLocalization.instance);
}

// Dio and related services
void _registerNetworking() {
  getIt.registerFactory<InternetConnection>(() => InternetConnection());
  getIt.registerFactory<ConnectionChecker>(
    () => ConnectionCheckerImpl(getIt<InternetConnection>()),
  );
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<DioClient>(() => DioClient(getIt<Dio>()));
  getIt.registerLazySingleton<ApiHelper>(
    () => ApiHelper(getIt<DioClient>(), getIt<ConnectionChecker>()),
  );
}

// Secure Storage
void _registerLocalStorage() {
  getIt.registerLazySingleton<FlutterSecureStorage>(() {
    if (!kIsWeb && Platform.isAndroid) {
      return FlutterSecureStorage(aOptions: _getAndroidOptions());
    } else if (!kIsWeb && Platform.isIOS) {
      return FlutterSecureStorage(iOptions: _getIOSOptions());
    } else {
      return const FlutterSecureStorage();
    }
  });
}

// Android storage options
AndroidOptions _getAndroidOptions() =>
    const AndroidOptions(encryptedSharedPreferences: true);

// iOS storage options
IOSOptions _getIOSOptions() =>
    const IOSOptions(accessibility: KeychainAccessibility.first_unlock);

void _initAuth() {
  // Datasource
  getIt.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(getIt<ApiHelper>()),
  );

  // repository
  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(getIt<LoginRemoteDataSource>()),
  );

  // use cases
  getIt.registerFactory<LoginUser>(() => LoginUser(getIt<LoginRepository>()));

  // Bloc
  getIt.registerLazySingleton(
    () => LoginBloc(loginUseCase: getIt<LoginUser>()),
  );
}

void _initProducts() {
  // datasource
  getIt.registerLazySingleton<ProductsRemoteDataSource>(
    () => ProductsRemoteDataSourceImp(getIt<ApiHelper>()),
  );

  // repository
  getIt.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(getIt<ProductsRemoteDataSource>()),
  );

  // use cases
  getIt.registerFactory<ProductsUseCase>(
    () => ProductsUseCase(getIt<ProductsRepository>()),
  );

  // Bloc
  getIt.registerFactory(
    () => ProductsBloc(productsUseCase: getIt<ProductsUseCase>()),
  );
}
