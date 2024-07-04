
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_store/core/helpers/extensions.dart';
import 'package:online_store/core/theming/app_text_styles.dart';

import '../../../../core/routing/routes.dart';

class DoNotHaveAnAccount extends StatelessWidget {
  const DoNotHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        const TextSpan(
            text: "Don't have an account yet?",
            style: AppTextStyles.font12BlackW400),
        TextSpan(text: " Sign Up", style: AppTextStyles.font14BlueW700,
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              context.pushReplacementNamed(Routes.signUpScreen);
            },
        ),
      ]),
    );
  }
}