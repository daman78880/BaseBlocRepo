import 'package:bloc_demo_project/feature/login/data/models/login_response_model.dart'
    show LoginResponseModel;
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponseModel loginResponseModel;
  const LoginSuccess(this.loginResponseModel);

  @override
  List<Object?> get props => [loginResponseModel];
}

class LoginFailure extends LoginState {
  final String error;
  const LoginFailure(this.error);

  @override
  List<Object?> get props => [error];
}


// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'login_state.freezed.dart';

// @freezed
// class LoginState with _$LoginState {
//   const factory LoginState.initial() = _Initial;
//   const factory LoginState.loading() = _Loading;
//   const factory LoginState.success(String userId) = _Success;
//   const factory LoginState.failure(String error) = _Failure;
// }


