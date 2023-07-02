import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> googleLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginInProgress());
    UserCredential? result;
    try {
      result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on Exception catch (e) {
      result = null;
      emit(LoginFailed());
    }
    if (result?.user?.uid != null) {
      emit(LoginCompleted());
    } else {
      emit(LoginFailed());
    }
  }
}
