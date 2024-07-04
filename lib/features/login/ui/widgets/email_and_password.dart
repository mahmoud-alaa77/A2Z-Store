import 'package:flutter/material.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_text_styles.dart';

import '../../../../core/widgets/app_text_form_field.dart';

class EmailAndPasswordForm extends StatefulWidget {
  const EmailAndPasswordForm({super.key});

  @override
  State<EmailAndPasswordForm> createState() => _EmailAndPasswordFormState();
}

class _EmailAndPasswordFormState extends State<EmailAndPasswordForm> {
  bool isSecure = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          hint: "Email",
          hintStyle: AppTextStyles.font16LightGrayW400,
          controller: emailController,
          validator: (value) {
            if (value!.isEmpty || value == "") {
              return "Please enter your email";
            }
            return null;
          },
        ),
        verticalSpace(12),
        AppTextFormField(
          controller: passwordController,
          hint: "Password",
          hintStyle: AppTextStyles.font16LightGrayW400,
          suffixIcon: IconButton(
            icon: Icon(isSecure ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                isSecure = !isSecure;
              });
            },
          ),
          obscureText: isSecure,
          validator: (value) {
            if (value!.isEmpty) {
              return "Please enter your password";
            }
            return null;
          },
        ),
      ],
    );
  }
}
