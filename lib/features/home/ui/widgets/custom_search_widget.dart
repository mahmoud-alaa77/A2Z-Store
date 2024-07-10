import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/theming/app_colors.dart';
import 'package:online_store/core/theming/app_text_styles.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100.w,
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
      ),
    );
  }
}





/*

TextFormField(
      keyboardType: keyboardType ?? TextInputType.text,
      controller: controller,
      validator: (value){
        return validator(value);
      },
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: hintStyle ?? AppTextStyles.font18LightGrayW400,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsetsDirectional.symmetric(vertical: 15.h, horizontal: 20.w),
        suffixIcon: suffixIcon,
        enabledBorder: enabledBorder ??
            const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(
                  color: AppColors.lightGray,
                  width: 1.0,
                )),
        focusedBorder: focusedBorder ??
            const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(
                  color: AppColors.mainBlack,
                  width: 1.0,
                )),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
            )),
        focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
            )),
        fillColor: backgroundColor ?? Colors.white,
        filled: true,
      ),
      obscureText: obscureText ?? false,
    );

*/