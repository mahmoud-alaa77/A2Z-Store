import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/helpers/constants.dart';
import 'package:online_store/core/theming/app_colors.dart';

class HomeAppBar extends StatelessWidget {
  final void Function()? onTap;
  const HomeAppBar({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        InkWell(
          onTap: onTap,
          child:  Icon(Icons.format_align_left_rounded, color: AppColors.mainBlack,size: 35.r,),
        ),
        CircleAvatar(
          backgroundColor: AppColors.darkGray,
          radius: 26.r,
          child: const CircleAvatar(
            
            backgroundColor: AppColors.lighterGray,
            backgroundImage: NetworkImage(MyAppImages.defaultUserImage),
            radius: 25.0,
          ),
        ),
      ],
    );
  }
}
