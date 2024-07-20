import 'package:flutter/widgets.dart';
import 'package:online_store/core/helpers/constants.dart';
import 'package:online_store/core/helpers/shared_pref_helper.dart';
import 'package:online_store/features/sign_up/data/models/user_model.dart';
import 'package:online_store/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/signup_request_model.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;
  SignUpCubit(this._signUpRepo) : super(SignUpInitial());

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  signUp() async {
    emit(SignUpLoading());

    SignUpRequestModel newUser = SignUpRequestModel(
      email: emailController.text,
      password: passwordController.text,
      name: userNameController.text,
    );
    var response = await _signUpRepo.signUp(newUser);

    response.fold(
      (failure) => emit(SignUpFailure(failure.errorMessage)),
      (userModel) {
        emit(SignUpSuccess(userModel));
        saveUserToken(userModel.token);
      }
    );
  }


Future<void> saveUserToken(String token) async {
    SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
  }

}
