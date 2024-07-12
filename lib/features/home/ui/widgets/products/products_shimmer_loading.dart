import 'package:flutter/material.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ProductsShimmerLoading extends StatelessWidget {
  const ProductsShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 0,
          crossAxisSpacing: 12,
          childAspectRatio: 9 / 15),
      itemCount: 8,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: AppColors.lightGray,
          highlightColor: AppColors.lighterGray,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2.1,
                height: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(24),
                ),
              ),
              verticalSpace(6),
              Container(
                width: MediaQuery.of(context).size.width / 2.1 - 25,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(24),
                ),
              ),
              verticalSpace(4),
              Container(
                width: MediaQuery.of(context).size.width / 2.1 - 50,
                height: 18,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(24),
                ),
              ),
              verticalSpace(4),
              Container(
                width: MediaQuery.of(context).size.width / 2.1 - 120,
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(24),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
