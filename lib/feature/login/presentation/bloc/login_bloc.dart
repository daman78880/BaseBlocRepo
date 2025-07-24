import 'package:bloc_demo_project/feature/login/presentation/bloc/login_event.dart';
import 'package:bloc_demo_project/feature/login/presentation/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/login_user.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUser _loginUseCase;
  LoginBloc({required LoginUser loginUseCase})
    : _loginUseCase = loginUseCase,
      super(LoginInitial()) {
    // on<SubmitLoginEvent>(_onLoginSubmitted);

    on<SubmitLoginEvent>((event, emit) async {
      await _onLoginSubmitted(event, emit);
    });
  }

  Future<void> _onLoginSubmitted(
    SubmitLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    // await Future.delayed(const Duration(seconds: 2));
    final result = await _loginUseCase.call(
      email: event.email,
      password: event.password,
    );
    result.match(
      (failure) => emit(LoginFailure(failure.message)),
      (user) => emit(LoginSuccess(user)),
    );
  }
}


// final result = await loginUseCase(email, password);
// result.match(
//   (failure) => emit(LoginError(failure.message)),
//   (user) => emit(LoginSuccess(user)),
// );
// try {
//   final user = await repository.login(email, password);
//   emit(LoginSuccess(user));
// } catch (e) {
//   emit(LoginError(e.toString()));
// }