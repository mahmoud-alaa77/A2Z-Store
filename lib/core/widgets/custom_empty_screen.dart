import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_store/core/helpers/constants.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_text_styles.dart';

class CustomEmptyScreen extends StatelessWidget {
  final String title;
  const CustomEmptyScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          MyAppImages.noDataSvgImage,
          width: 200.w,
          height: 200.h,
        ),
        verticalSpace(12),
         Text(
          title,
          style: AppTextStyles.font18BlackW900,
        ),
      ],
    );
  }
}
