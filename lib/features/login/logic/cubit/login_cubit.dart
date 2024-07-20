import 'package:flutter/material.dart';
import 'package:online_store/core/helpers/constants.dart';
import 'package:online_store/core/helpers/shared_pref_helper.dart';
import 'package:online_store/features/login/data/models/login_request_model.dart';
import 'package:online_store/features/login/data/repos/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginInitial());

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  login() async {
    emit(LoginLoading());

    var response = await _loginRepo.login(LoginRequestModel(
        email: emailController.text, password: passwordController.text));

    response.fold((failure) {
      emit(LoginFailure(message: failure.errorMessage));
    }, (userCredential) async {
      await saveUserToken(userCredential.user!.uid);
      emit(LoginSuccess(userCredential.user!.uid));
    });
  }

  loginWithGoogle() async {
    emit(LoginLoading());

    var response = await _loginRepo.signInWithGoogle();

    response?.fold((failure) {
      emit(LoginFailure(message: failure.errorMessage));
    }, (userCredential) {
      saveUserToken(userCredential.user!.uid);
      emit(LoginSuccess(userCredential.user!.uid));
    });
  }

  Future<void> saveUserToken(String token) async {
    SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
  }
}
