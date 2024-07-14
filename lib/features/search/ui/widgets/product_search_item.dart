import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_store/core/helpers/extensions.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/routing/routes.dart';
import 'package:online_store/core/theming/app_colors.dart';
import 'package:online_store/core/theming/app_text_styles.dart';
import 'package:online_store/features/home/data/models/product_model.dart';
import 'package:online_store/features/product_details/ui/widgets/rating_widget.dart';

class ProductSearchItem extends StatelessWidget {
  final Product product;
  const ProductSearchItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.productDetailsScreen, arguments: product);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: AppColors.lighterGray),
            child: ClipRRect(
              borderRadius: BorderRadiusDirectional.circular(24),
              child: CachedNetworkImage(
                imageUrl: product.mainImage.toString(),
                width: MediaQuery.of(context).size.width / 2.6,
                height: MediaQuery.of(context).size.width / 2,
                fit: BoxFit.fill,
              ),
            ),
          ),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(4),
                Text(
                  product.title ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.font18BlackW900,
                ),
                verticalSpace(6),
                RatingWidget(
                    ratingValue: product.rating!.toDouble(),
                    numsOfReview: product.reviews!.length),
                verticalSpace(4),
                Text(
                  product.brand.toString(),
                  style: AppTextStyles.font12DarkGrayW400,
                ),
                verticalSpace(4),
                Text(
                  "\$ ${product.price.toString()}",
                  style: AppTextStyles.font16BlackW400,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
