import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/helpers/extensions.dart';
import 'package:online_store/features/login/logic/cubit/login_cubit.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          context.pop();
          setLoginFailure(context, state.message).show();
        } else if (state is LoginSuccess) {
          context.pop();
          context.pushNamed(Routes.homeScreen);
        } else {
          setLoading(context);
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  AwesomeDialog setLoginFailure(BuildContext context, String text) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.bottomSlide,
      title: 'ERROR !',
      desc: text,
      btnOkOnPress: () {},
    );
  }
}

Future<dynamic> setLoading(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(
          color: AppColors.mainBlack,
        ),
      );
    },
  );
}
