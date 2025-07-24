import 'package:bloc_demo_project/core/network/api_result.dart';
import 'package:bloc_demo_project/feature/login/data/models/login_response_model.dart'
    show LoginResponseModel;
import 'package:bloc_demo_project/feature/login/domain/repositories/login_repository.dart';
import 'package:fpdart/fpdart.dart';
import '../datasources/login_remote_datasource.dart';
import '../models/login_request_model.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, LoginResponseModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final request = LoginRequestModel(email: email, password: password);
      final userModel = await remoteDataSource.login(request);
      return Right(userModel); // since UserModel extends User
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      }
      return Left(Failure(e.toString()));
    }
  }
}
