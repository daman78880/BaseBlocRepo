import 'package:bloc_demo_project/feature/login/domain/entities/user.dart'
    show User;
import 'package:fpdart/fpdart.dart';
import '../../../../core/network/api_result.dart';

abstract class LoginRepository {
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  });
}
