import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/helpers/regex.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_text_styles.dart';
import 'package:online_store/core/widgets/app_text_form_field.dart';
import 'package:online_store/features/sign_up/logic/sign_up_cubit.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isVisable = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hint: "Username",
            hintStyle: AppTextStyles.font16LightGrayW400,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your username";
              }
              return null;
            },
            controller: context.read<SignUpCubit>().userNameController,
          ),
          verticalSpace(12),
          AppTextFormField(
            controller: context.read<SignUpCubit>().emailController,
            hint: "Email",
            hintStyle: AppTextStyles.font16LightGrayW400,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return "Please enter a vaild email";
              }
              return null;
            },
          ),
          verticalSpace(12),
          AppTextFormField(
            controller: context.read<SignUpCubit>().passwordController,
            hint: "Password",
            hintStyle: AppTextStyles.font16LightGrayW400,
            suffixIcon: IconButton(
              icon: Icon( isVisable ?  Icons.visibility_off:Icons.visibility ),
              onPressed: () {
                setState(() {
                  isVisable = !isVisable;
                });
              },
            ),
            obscureText: !isVisable,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)) {
                return "Please enter a vaild password";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
