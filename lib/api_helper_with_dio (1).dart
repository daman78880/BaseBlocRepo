// // 📁 lib/core/network/api_config.dart
// class ApiConfig {
//   ApiConfig._();

//   static const token =
//       "6369de3d8da8e764cc3c1cbe4121bb6741875de2c30dfd39df8fd351b6a508ea";
//   static const String baseUrl = "https://gorest.co.in/public/v2";
//   static const Duration receiveTimeout = Duration(milliseconds: 15000);
//   static const Duration connectionTimeout = Duration(milliseconds: 15000);

//   static const String users = '/users';
//   static const String posts = '/posts';
//   static const String comments = '/comments';
//   static const String todos = '/todos';

//   static const headers = {
//     'Authorization': 'Bearer $token',
//     'Content-Type': 'application/json',
//   };
// }


// // 📁 lib/core/network/request_type.dart
// enum RequestType { get, post, put, patch, delete }


// // 📁 lib/core/network/api_result.dart
// sealed class ApiResult<T> {}

// class Success<T> extends ApiResult<T> {
//   final T data;
//   Success(this.data);
// }

// class Failure<T> extends ApiResult<T> {
//   final String message;
//   Failure(this.message);
// }


// // 📁 lib/core/network/dio_exceptions.dart
// import 'package:dio/dio.dart';

// class DioExceptions implements Exception {
//   late String message;

//   DioExceptions.fromDioError(DioException dioException) {
//     switch (dioException.type) {
//       case DioExceptionType.cancel:
//         message = "Request to API server was cancelled";
//         break;
//       case DioExceptionType.connectionTimeout:
//         message = "Connection timeout with API server";
//         break;
//       case DioExceptionType.receiveTimeout:
//         message = "Receive timeout in connection with API server";
//         break;
//       case DioExceptionType.sendTimeout:
//         message = "Send timeout in connection with API server";
//         break;
//       case DioExceptionType.connectionError:
//         message = "Connection failed due to internet connection";
//         break;
//       case DioExceptionType.badResponse:
//         message = _handleError(
//             dioException.response?.statusCode, dioException.response?.data);
//         break;
//       default:
//         message = "Unexpected error occurred";
//     }
//   }

//   String _handleError(int? statusCode, dynamic error) {
//     switch (statusCode) {
//       case 400:
//         return "Bad request";
//       case 401:
//         return "Unauthorized";
//       case 403:
//         return "Forbidden";
//       case 404:
//         return "Not found";
//       case 500:
//         return "Internal server error";
//       default:
//         return "Something went wrong";
//     }
//   }

//   @override
//   String toString() => message;
// }


// // 📁 lib/core/network/dio_interceptor.dart
// import 'package:dio/dio.dart';
// import 'package:logger/logger.dart';

// class DioInterceptor extends Interceptor {
//   final Logger logger = Logger();

//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     logger.i('Request [${options.method}] => PATH: ${options.baseUrl}${options.path}');
//     logger.i('Headers => ${options.headers}');
//     if (options.data != null) logger.i('Body => ${options.data}');
//     super.onRequest(options, handler);
//   }

//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     logger.i('Response => ${response.statusCode} ${response.data}');
//     super.onResponse(response, handler);
//   }

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) {
//     logger.e('Error => ${err.message}');
//     super.onError(err, handler);
//   }
// }


// // 📁 lib/core/network/dio_client.dart
// import 'package:dio/dio.dart';
// import 'api_config.dart';
// import 'dio_interceptor.dart';

// class DioClient {
//   final Dio _dio;

//   DioClient(this._dio) {
//     _dio
//       ..options.baseUrl = ApiConfig.baseUrl
//       ..options.connectTimeout = ApiConfig.connectionTimeout
//       ..options.receiveTimeout = ApiConfig.receiveTimeout
//       ..options.headers = ApiConfig.headers
//       ..options.responseType = ResponseType.json
//       ..interceptors.add(DioInterceptor());
//   }

//   Dio get dio => _dio;
// }


// // 📁 lib/core/network/api_helper.dart
// import 'package:dio/dio.dart';
// import 'api_result.dart';
// import 'dio_exceptions.dart';
// import 'request_type.dart';
// import 'dio_client.dart';
// import 'api_config.dart';

// class ApiHelper {
//   final DioClient _dioClient;

//   ApiHelper(this._dioClient);

//   Future<ApiResult<T>> request<T>({
//     required String path,
//     required RequestType method,
//     dynamic body,
//     Map<String, dynamic>? queryParams,
//     T Function(dynamic data)? decoder,
//     Map<String, String>? headers,
//     String? baseUrl,
//   }) async {
//     try {
//       final dio = _dioClient.dio;

//       final options = Options(
//         headers: {
//           ...ApiConfig.headers,
//           if (headers != null) ...headers,
//         },
//       );

//       Response response;

//       switch (method) {
//         case RequestType.get:
//           response = await dio.get(path, queryParameters: queryParams, options: options);
//           break;
//         case RequestType.post:
//           response = await dio.post(path, data: body, options: options);
//           break;
//         case RequestType.put:
//           response = await dio.put(path, data: body, options: options);
//           break;
//         case RequestType.patch:
//           response = await dio.patch(path, data: body, options: options);
//           break;
//         case RequestType.delete:
//           response = await dio.delete(path, data: body, options: options);
//           break;
//       }

//       final parsed = decoder != null ? decoder(response.data) : response.data as T;
//       return Success(parsed);
//     } on DioException catch (e) {
//       final message = DioExceptions.fromDioError(e).toString();
//       return Failure(message);
//     } catch (e) {
//       return Failure("Unexpected error: ${e.toString()}");
//     }
//   }
// }


// // 📁 lib/core/di/injection.dart
// import 'package:get_it/get_it.dart';
// import 'package:dio/dio.dart';
// import '../network/dio_client.dart';
// import '../network/api_helper.dart';

// final getIt = GetIt.instance;

// Future<void> init() async {
//   // Dio instance
//   getIt.registerLazySingleton<Dio>(() => Dio());

//   // Dio client
//   getIt.registerLazySingleton<DioClient>(() => DioClient(getIt<Dio>()));

//   // API helper
//   getIt.registerLazySingleton<ApiHelper>(() => ApiHelper(getIt<DioClient>()));
// }


// // 📁 lib/features/users/models/user_model.dart
// class UserModel {
//   final int id;
//   final String name;
//   final String email;

//   UserModel({
//     required this.id,
//     required this.name,
//     required this.email,
//   });

//   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//         id: json['id'],
//         name: json['name'],
//         email: json['email'],
//       );
// }


// // 📁 lib/features/users/repositories/user_repository.dart
// import 'package:bloc_demo_project/core/network/api_helper.dart';
// import 'package:bloc_demo_project/core/network/api_result.dart';
// import 'package:bloc_demo_project/core/network/request_type.dart';
// import 'package:bloc_demo_project/core/network/api_config.dart';
// import 'package:bloc_demo_project/core/di/injection.dart';
// import '../models/user_model.dart';

// class UserRepository {
//   final ApiHelper _apiHelper = getIt<ApiHelper>();

//   Future<ApiResult<List<UserModel>>> getUsers() async {
//     return await _apiHelper.request<List<UserModel>>(
//       path: ApiConfig.users,
//       method: RequestType.get,
//       decoder: (data) => (data as List)
//           .map((json) => UserModel.fromJson(json))
//           .toList(),
//     );
//   }
// }


// // ✅ Example usage:
// // void fetchUsers() async {
// //   final userRepository = UserRepository();
// //   final result = await userRepository.getUsers();
// //
// //   result is Success
// //       ? print("Users: \${result.data}")
// //       : print("Error: \${(result as Failure).message}");
// // }
