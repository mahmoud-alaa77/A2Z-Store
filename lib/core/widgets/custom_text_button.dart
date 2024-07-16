import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_text_styles.dart';

import '../theming/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? style;
  final Color? color;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final String? image;
  final bool showImage;
  const CustomTextButton(
      {super.key,
      required this.title,
      this.onTap,
      this.width,
      this.height,
      this.borderRadius,
      this.style,
      this.color,
      this.icon,
      this.iconColor,
      this.iconSize,
      this.image,
      this.showImage=false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 311.w,
        height: height ?? 52.h,
        decoration: BoxDecoration(
            color: color ?? AppColors.mainBlack,
            borderRadius: borderRadius ?? BorderRadiusDirectional.circular(16),
            border: Border.all(
              color: AppColors.mainBlack,
              width: 1,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           showImage ? Image.asset(image!,width: 40,height: 40,): Icon(
              icon,
              color: iconColor,
              size: iconSize,
            ),
            horizontalSpace(5),
            Text(
              title,
              style: style ?? AppTextStyles.font16WhiteW700,
            ),
            horizontalSpace(22)
          ],
        ),
      ),
    );
  }
}
