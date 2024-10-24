import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_demo/utils/enums.dart';

import '../../repository/auth_repository.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthRepository authRepository;

  LoginBloc(this.authRepository) : super(const LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_loginUser);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _loginUser(LoginApi event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    await authRepository.loginUser(state.email, state.password).then((value) {
      emit(
        state.copyWith(
          loginStatus: LoginStatus.success,
          message: value,
        ),
      );
    }).onError((error, stackTrace) {
      emit(
        state.copyWith(
          loginStatus: LoginStatus.error,
          message: error.toString(),
        ),
      );
    });
  }
}
