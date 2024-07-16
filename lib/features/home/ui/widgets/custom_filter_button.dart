import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/theming/app_colors.dart';

class CustomFilterButton extends StatelessWidget {
 final void Function()? onTap;
  const CustomFilterButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 50.w,
        height: 50.h,
        padding: const EdgeInsetsDirectional.all(6),
        decoration: BoxDecoration(
            color: AppColors.mainBlack,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadiusDirectional.circular(12)),
        child: Image.asset(
          "assets/icons/filter_icon.png",
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
