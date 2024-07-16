import 'package:flutter/material.dart';
import 'package:online_store/core/theming/app_text_styles.dart';

class ApplayAndCancelButtons extends StatelessWidget {
  final void Function()? onPressedApplay;
  final void Function()? onPressedCancel;
  const ApplayAndCancelButtons(
      {super.key, this.onPressedApplay, this.onPressedCancel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
            onPressed: onPressedApplay,
            child: const Text(
              "Apply",
              style: AppTextStyles.font14BlueW700,
            )),
        TextButton(
            onPressed: onPressedCancel,
            child: Text(
              "Cancel",
              style: AppTextStyles.font14BlueW700.copyWith(color: Colors.red),
            )),
      ],
    );
  }
}
