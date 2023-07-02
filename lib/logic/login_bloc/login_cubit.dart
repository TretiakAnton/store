import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/snackbar.dart';
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
    } on FirebaseAuthException catch (e) {
      CustomSnackbar().showSnackBar(label: e.message ?? 'Something went wrong');
      emit(LoginFailed());
    }
    if (isAuthenticated) {
      emit(LoginCompleted());
    } else {
      emit(LoginFailed());
    }
  }
}
