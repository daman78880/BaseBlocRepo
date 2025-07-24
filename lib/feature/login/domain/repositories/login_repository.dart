import 'package:bloc_demo_project/feature/login/data/models/login_response_model.dart'
    show LoginResponseModel;
import 'package:fpdart/fpdart.dart';
import '../../../../core/network/api_result.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginResponseModel>> login({
    required String email,
    required String password,
  });
}
