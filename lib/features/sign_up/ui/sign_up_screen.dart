import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/helpers/constants.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_text_styles.dart';
import 'package:online_store/core/widgets/custom_text_button.dart';
import 'package:online_store/features/sign_up/logic/sign_up_cubit.dart';
import 'package:online_store/features/sign_up/ui/widgets/already_have_an_account.dart';
import 'package:online_store/features/sign_up/ui/widgets/sign_up_bloc_listener.dart';
import 'package:online_store/features/sign_up/ui/widgets/sign_up_form.dart';
import 'package:online_store/features/sign_up/ui/widgets/terms_and_conications.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                "Sign Up",
                style: AppTextStyles.font24BlackW900,
              ),
              verticalSpace(8),
              const Text(
                "Create An New Account.",
                style: AppTextStyles.font16LightGrayW400,
              ),
              verticalSpace(24),
              const SignUpForm(),
              verticalSpace(12),
              const AlreadyHaveAnAccount(),
              verticalSpace(36),
              CustomTextButton(
                title: "Sign Up",
                width: double.infinity,
                onTap: () {
                  if (context
                      .read<SignUpCubit>()
                      .formKey
                      .currentState!
                      .validate()) {
                    context.read<SignUpCubit>().signUp();
                  }
                },
              ),
              verticalSpace(12),
              const TermsAndCondications(),
              const SignUpBlocListener(),
            ],
          ),
        ),
      )),
    );
  }
}
