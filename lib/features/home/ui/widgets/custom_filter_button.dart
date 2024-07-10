import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/theming/app_colors.dart';

class CustomFilterButton extends StatelessWidget {
  const CustomFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 45.w,
        height: 45.h,
        padding: const EdgeInsetsDirectional.all(6),
        decoration: const BoxDecoration(
          color: AppColors.mainBlack,
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          "assets/icons/filter_icon.png",
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
