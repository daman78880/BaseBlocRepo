import 'package:bloc_demo_project/feature/login/data/models/login_response_model.dart'
    show LoginResponseModel;
import 'package:fpdart/fpdart.dart';
import '../../../../core/network/api_result.dart';
import '../repositories/login_repository.dart';

class LoginUser {
  final LoginRepository repository;

  LoginUser(this.repository);

  Future<Either<Failure, LoginResponseModel>> call({
    required String email,
    required String password,
  }) {
    return repository.login(email: email, password: password);
  }
}
