import 'package:flutter/material.dart';
import 'package:online_store/core/helpers/constants.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_text_styles.dart';
import 'package:online_store/core/widgets/custom_divider_widget.dart';
import 'package:online_store/core/widgets/custom_text_button.dart';
import 'package:online_store/features/login/ui/widgets/do_not_have_an_account.dart';
import 'package:online_store/features/login/ui/widgets/email_and_password.dart';

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
              const CustomTextButton(
                title: "Login",
                width: double.infinity,
              ),
              verticalSpace(12),
              const CustomDividerWidget(),
              verticalSpace(12),
              const CustomTextButton(
                title: "Continue with facebook",
                width: double.infinity,
                color: Color.fromARGB(255, 3, 115, 207),
                icon: Icons.facebook,
                iconColor: Colors.white,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
