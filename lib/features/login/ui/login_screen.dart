import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/helpers/constants.dart';
import 'package:online_store/core/helpers/extensions.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/routing/routes.dart';
import 'package:online_store/core/theming/app_text_styles.dart';
import 'package:online_store/core/widgets/custom_divider_widget.dart';
import 'package:online_store/core/widgets/custom_text_button.dart';
import 'package:online_store/features/login/logic/cubit/login_cubit.dart';
import 'package:online_store/features/login/ui/widgets/do_not_have_an_account.dart';
import 'package:online_store/features/login/ui/widgets/email_and_password.dart';
import 'package:online_store/features/login/ui/widgets/login_bloc_listener.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                MyAppImages.logoWithoutBackgroundImage,
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 3,
              ),
              const Text(
                "Welcome!",
                style: AppTextStyles.font24BlackW900,
              ),
              verticalSpace(8),
              const Text(
                "Please login or sign up to continue our app.",
                style: AppTextStyles.font16LightGrayW400,
              ),
              verticalSpace(24),
              Form(key: formKey, child: const EmailAndPasswordForm()),
              verticalSpace(12),
              const DoNotHaveAnAccount(),
              verticalSpace(36),
              CustomTextButton(
                title: "Login",
                width: double.infinity,
                onTap: () {
                  if (context
                      .read<LoginCubit>()
                      .formKey
                      .currentState!
                      .validate()) {
                    context.read<LoginCubit>().login();
                  }
                },
              ),
              verticalSpace(12),
              const CustomDividerWidget(),
              verticalSpace(12),
              CustomTextButton(
                title: "Continue with Google",
                width: double.infinity,
                color: Colors.white,
                showImage: true,
                image: "assets/icons/gmail_icon.png",
                style: AppTextStyles.font16BlackW400,
                onTap: ()async {
                await  context.read<LoginCubit>().loginWithGoogle();
                  // ignore: use_build_context_synchronously
                  context.pushReplacementNamed(Routes.homeScreen);
                },
              ),
              const LoginBlocListener(),
            ],
          ),
        ),
      )),
    );
  }
}
