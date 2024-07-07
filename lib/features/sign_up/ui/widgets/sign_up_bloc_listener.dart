import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/helpers/extensions.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_colors.dart';
import 'package:online_store/core/theming/app_text_styles.dart';
import 'package:online_store/features/sign_up/logic/sign_up_cubit.dart';

import '../../../../core/routing/routes.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      // listenWhen: (previous, current) => current is SignUpFailure || current is SignUpSuccess ||current is SignUpLoading,
      listener: (context, state) {
        if (state is SignUpFailure) {
          context.pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
        } else if (state is SignUpSuccess) {
          context.pop();

          setSignUpSuccess(context);
        } else {
          setLoading(context);
        }
      },

      child: const SizedBox.shrink(),
    );
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

  Future<dynamic> setSignUpSuccess(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(children: [
            Icon(
              Icons.check_circle_outline,
              color: const Color.fromARGB(255, 21, 180, 6),
              size: 35.sp,
            ),
            horizontalSpace(10),
            const Text('Successfully', style: AppTextStyles.font24BlackW900),
          ]),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Congratulations, you have signed up successfully 🎉',
                  style: AppTextStyles.font18DarkGrayW700,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: AppColors.mainBlack,
                  disabledForegroundColor: Colors.grey.withOpacity(0.38),
                ),
                onPressed: () {
                  context.pushNamed(Routes.homeScreen);
                },
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('Start Shopping'),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
