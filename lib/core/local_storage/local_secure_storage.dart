import 'package:bloc_demo_project/di.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalSecureStorage {
  // Singleton pattern
  static final LocalSecureStorage _instance = LocalSecureStorage._internal();
  factory LocalSecureStorage() => _instance;
  LocalSecureStorage._internal();

  static const String tokenKey = 'token';
  static const String refreshTokenKey = 'refreshToken';

  // Read value
  Future<String?> getToken() async {
    return await getIt<FlutterSecureStorage>().read(key: tokenKey);
  }

  // Write value
  Future<void> write({required String key, required String value}) async {
    await getIt<FlutterSecureStorage>().write(key: key, value: value);
  }

  // Read value
  Future<String?> read({required String key}) async {
    return await getIt<FlutterSecureStorage>().read(key: key);
  }

  // Read all values
  Future<Map<String, String>> readAll() async {
    return await getIt<FlutterSecureStorage>().readAll();
  }

  // Delete value
  Future<void> delete({required String key}) async {
    await getIt<FlutterSecureStorage>().delete(key: key);
  }

  // Delete all values
  Future<void> deleteAll() async {
    await getIt<FlutterSecureStorage>().deleteAll();
  }
}
