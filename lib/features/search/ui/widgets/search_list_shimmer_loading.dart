import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_colors.dart';

import 'package:shimmer/shimmer.dart';

class SearchListShimmerLoading extends StatelessWidget {
  const SearchListShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: AppColors.lighterGray,
        highlightColor: Colors.white,
        child: ListView.separated(
          separatorBuilder: (context, index) => verticalSpace(16),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: AppColors.lighterGray),
                  width: MediaQuery.of(context).size.width / 2.6,
                  height: MediaQuery.of(context).size.width / 2,
                ),
                horizontalSpace(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(4),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.lighterGray),
                        width: MediaQuery.of(context).size.width,
                        height: 32.h,
                      ),
                      verticalSpace(8),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.lighterGray),
                        width: MediaQuery.of(context).size.width - 150.w,
                        height: 24.h,
                      ),
                      verticalSpace(8),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.lighterGray),
                        width: MediaQuery.of(context).size.width - 180.w,
                        height: 24.h,
                      ),
                      verticalSpace(8),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.lighterGray),
                        width: MediaQuery.of(context).size.width - 180.w,
                        height: 24.h,
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ));
  }
}
