import 'package:flutter/material.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_text_styles.dart';
import 'package:online_store/core/widgets/app_text_form_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isVisable = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          hint: "Username",
          hintStyle: AppTextStyles.font16LightGrayW400,
          validator: (value) {
            if (value!.isEmpty || value == "") {
              return "Please enter your email";
            }
            return null;
          },
        ),
        verticalSpace(12),
        AppTextFormField(
          hint: "Email",
          hintStyle: AppTextStyles.font16LightGrayW400,
          validator: (value) {
            if (value!.isEmpty || value == "") {
              return "Please enter your email";
            }
            return null;
          },
        ),
        verticalSpace(12),
        AppTextFormField(
          hint: "Password",
          hintStyle: AppTextStyles.font16LightGrayW400,
          suffixIcon: IconButton(
            icon:
                Icon(isVisable ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                isVisable = !isVisable;
              });
            },
          ),
          obscureText: isVisable,
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
