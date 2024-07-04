import 'package:flutter/material.dart';
import 'package:online_store/core/theming/app_colors.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: AppColors.lightGray,
          ),
        ),
        const Text("  or  "),
        Expanded(
          child: Container(
            height: 1,
            color: AppColors.lightGray,
          ),
        ),
      ],
    );
  }
}
