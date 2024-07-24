import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_colors.dart';
import 'package:online_store/core/theming/app_text_styles.dart';
import 'package:online_store/features/favorite_products/data/models/fav_product_model.dart';
import 'package:online_store/features/product_details/ui/widgets/rating_widget.dart';

class FavoriteProductItem extends StatelessWidget {
  final FavProductModel product;
  final void Function()? onPressed;
  const FavoriteProductItem({super.key, required this.product, this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(8),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadiusDirectional.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                //color: AppColors.lighterGray.withOpacity(.5),
                gradient: LinearGradient(colors: [
                  Colors.white,
                  AppColors.lightGray.withOpacity(.3),
                   Colors.white,
                ])
                ),
            child: ClipRRect(
              borderRadius: BorderRadiusDirectional.circular(24),
              child: CachedNetworkImage(
                imageUrl: product.image.toString(),
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
                    numsOfReview: product.numOfReviews!.toInt()),
                verticalSpace(4),
                Text(
                  product.category.toString(),
                  style: AppTextStyles.font12DarkGrayW400,
                ),
                verticalSpace(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ ${product.price.toString()}",
                      style: AppTextStyles.font16BlackW400,
                    ),
                    IconButton(onPressed: onPressed, icon:  Icon(Icons.delete_forever_outlined,color: Colors.red,size: 35.r,))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
