import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/theming/app_colors.dart';
import 'package:online_store/core/theming/app_text_styles.dart';

class CustomSearchWidget extends StatelessWidget {
  final void Function(String)? onChanged;
  const CustomSearchWidget({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextField(
      
        cursorColor: AppColors.mainBlack,
        autofocus: false,
        decoration: InputDecoration(
          hintText: "Search Here...",
          prefixIcon: Icon(
            Icons.search_rounded,
            size: 30.w,
          ),
          hintStyle: AppTextStyles.font12BlackW400,
          contentPadding:
              EdgeInsetsDirectional.symmetric(vertical: 16.h, horizontal: 20.w),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              borderSide: BorderSide(color: AppColors.lighterGray)),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              borderSide: BorderSide(color: AppColors.lighterGray)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              borderSide: BorderSide(color: AppColors.lighterGray)),
          fillColor: AppColors.lighterGray,
          filled: true,
          
        ),
        onChanged: onChanged,
        
      ),
    );
  }
}





