import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/helpers/regex.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_text_styles.dart';
import 'package:online_store/features/login/logic/cubit/login_cubit.dart';

import '../../../../core/widgets/app_text_form_field.dart';

class EmailAndPasswordForm extends StatefulWidget {
  const EmailAndPasswordForm({super.key});

  @override
  State<EmailAndPasswordForm> createState() => _EmailAndPasswordFormState();
}

class _EmailAndPasswordFormState extends State<EmailAndPasswordForm> {
  bool isSecure = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hint: "Email",
            hintStyle: AppTextStyles.font16LightGrayW400,
            controller: context.read<LoginCubit>().emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your email";
              } else if (!AppRegex.isEmailValid(value)) {
                return "Please enter a vaild email";
              }
              return null;
            },
          ),
          verticalSpace(12),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
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
              if (value == null || value.isEmpty) {
                return "Please enter your password";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
