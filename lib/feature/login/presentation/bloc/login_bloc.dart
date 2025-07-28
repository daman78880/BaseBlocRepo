import 'package:bloc_demo_project/feature/login/presentation/bloc/login_event.dart';
import 'package:bloc_demo_project/feature/login/presentation/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/login_user.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUser _loginUseCase;
  LoginBloc({required LoginUser loginUseCase})
    : _loginUseCase = loginUseCase,
      super(LoginInitial()) {
    on<SubmitLoginEvent>((event, emit) async {
      await _onLoginSubmitted(event, emit);
    });
  }

  Future<void> _onLoginSubmitted(
    SubmitLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    if (!emit.isDone) {
      emit(LoginLoading());
    }

    try {
      final result = await _loginUseCase.call(
        email: event.email,
        password: event.password,
      );

      // Check if the bloc is still active before emitting
      if (!emit.isDone) {
        result.match(
          (failure) => emit(LoginFailure(failure.message)),
          (user) => emit(LoginSuccess(user)),
        );
      }
    } catch (e) {
      // Check if the bloc is still active before emitting error
      if (!emit.isDone) {
        emit(LoginFailure(e.toString()));
      }
    }
  }
}
