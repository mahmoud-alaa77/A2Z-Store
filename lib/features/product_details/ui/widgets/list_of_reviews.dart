import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_colors.dart';
import 'package:online_store/core/theming/app_text_styles.dart';
import 'package:online_store/features/home/data/models/product_model.dart';

class ListOfReviews extends StatelessWidget {
  final Product product;
  const ListOfReviews({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) {
        return const Divider(
          color: AppColors.lighterGray,
        );
      },
      itemCount: product.reviews!.length,
      itemBuilder: (context, index) {
        return ReviewItem(
          index: index,
          product: product,
        );
      },
    );
  }
}

class ReviewItem extends StatelessWidget {
  final int index;
  final Product product;
const ReviewItem({super.key, required this.index, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               CircleAvatar(
                backgroundColor: AppColors.lighterGray,
                radius: 20.r,
                child: const Icon(Icons.person),
              ),
              horizontalSpace(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: product.reviews![index].reviewerName,
                      style: AppTextStyles.font16BlackW400
                          .copyWith(fontFamily: "Margarine"),
                      children: [
                        TextSpan(
                            text:
                                " (⭐${product.reviews![index].rating.toString()})",
                            style: AppTextStyles.font12BlackW400
                                .copyWith(color: Colors.blue)),
                      ],
                    ),
                  ),
                  verticalSpace(4),
                  Text(
                    product.reviews![index].date,
                    style: AppTextStyles.font12DarkGrayW400,
                  ),
                ],
              )
            ],
          ),
          verticalSpace(4),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              vertical: 4,
              horizontal: 12
            ),
            child:  RichText(
                    text: TextSpan(
                      text: "Comment: ",
                      style: AppTextStyles.font14BlueW700
                          .copyWith(fontFamily: "Margarine"),
                      children: [
                        TextSpan(
                            text:
                                product.reviews![index].comment,
                            style: AppTextStyles.font12BlackW400
                                ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
