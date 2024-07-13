import 'package:flutter/material.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_colors.dart';
import 'package:online_store/core/theming/app_text_styles.dart';

class CategoryAndBrand extends StatelessWidget {
  final String category;
  final String brand;
  const CategoryAndBrand({super.key, required this.category, required this.brand});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding:
              const EdgeInsetsDirectional.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.mainBlack,
            borderRadius: BorderRadiusDirectional.circular(8),
          ),
          child:  Text(
            category,
            style: AppTextStyles.font14WhiteW500,
          ),
        ),
        horizontalSpace(6),
        Container(
          padding:
              const EdgeInsetsDirectional.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.darkGray,
            borderRadius: BorderRadiusDirectional.circular(8),
          ),
          child:  Text(
            brand,
            style: AppTextStyles.font14WhiteW500,
          ),
        ),
      ],
    );
  }
}
