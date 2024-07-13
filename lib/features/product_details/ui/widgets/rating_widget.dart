import 'package:flutter/material.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_text_styles.dart';

class RatingWidget extends StatelessWidget {
  final double ratingValue;
  final int numsOfReview;
  const RatingWidget({super.key, required this.ratingValue, required this.numsOfReview});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding:
              const EdgeInsetsDirectional.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(6),
              color: Colors.amber),
          child:  Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.star,
                color: Colors.white,
              ),
              Text(
                ratingValue.toString(),
                style: AppTextStyles.font16WhiteW700,
              )
            ],
          ),
        ),
        horizontalSpace(8),
         Text("( $numsOfReview Review )")
      ],
    );
  }
}
