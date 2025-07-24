import '../models/login_response_model.dart';
import '../models/login_request_model.dart';

abstract class LoginRemoteDataSource {
  Future<LoginResponseModel> login(LoginRequestModel request);
}
