import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/networking/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final AuthRepository _repository = AuthRepository();

  Future<void> googleLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginInProgress());
    bool isAuthenticated = false;
    try {
      isAuthenticated = await _repository.login(
        email: email,
        password: password,
      );
    } on Exception catch (_) {
      emit(LoginFailed());
    }
    if (isAuthenticated) {
      emit(LoginCompleted());
    } else {
      emit(LoginFailed());
    }
  }
}
