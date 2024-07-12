import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmerLoading extends StatelessWidget {
  const CategoryShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 8),
          child: Shimmer.fromColors(
            baseColor: AppColors.lightGray,
            highlightColor: AppColors.lighterGray,
            child: Column(
              children: [
                Container(
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(12),
                      color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
