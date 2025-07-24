class ApiConfig {
  ApiConfig._();

  static const String baseUrl = "https://api.escuelajs.co/api/v1";
  static const Duration receiveTimeout = Duration(milliseconds: 15000);
  static const Duration connectionTimeout = Duration(milliseconds: 15000);

  static Map<String, String> get headers => {
    'Content-Type': 'application/json',
  };

  // Endpoints
  static const String login = '/auth/login';
  static const String products = '/products';
  static const String categories = '/categories';
  static const String users = '/users';
  static const String posts = '/posts';
  static const String comments = '/comments';
  static const String todos = '/todos';
}
