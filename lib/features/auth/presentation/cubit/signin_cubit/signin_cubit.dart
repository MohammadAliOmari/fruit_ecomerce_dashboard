import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashboard/features/auth/domain/entites/user_entity.dart';
import 'package:fruit_dashboard/features/auth/domain/repos/auth_repo.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this._authRepo) : super(SigninInitial());
  final AuthRepo _authRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  bool obscureText = true;
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SigninLoading());
    final result = await _authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(SigninFailure(failure.message)),
      (user) => emit(SigninSuccess(user)),
    );
  }

  // Future<void> signInWithGoogle() async {
  //   emit(SigninLoading());
  //   final result = await _authRepo.signInWithGoogle();
  //   result.fold(
  //     (failure) => emit(SigninFailure(failure.message)),
  //     (user) => emit(SigninSuccess(user)),
  //   );
  // }

  // Future<void> signInWithFacebook() async {
  //   emit(SigninLoading());
  //   final result = await _authRepo.signInWithFacebook();
  //   result.fold(
  //     (failure) => emit(SigninFailure(failure.message)),
  //     (user) => emit(SigninSuccess(user)),
  //   );
  // }

  void togglePasswordVisibility() {
    obscureText = !obscureText;
    log('obscureText $obscureText');
    emit(PasswordVisibilityState());
  }

  dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
