
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_colors.dart';
import 'package:online_store/core/theming/app_text_styles.dart';
import 'package:online_store/features/home/data/models/product_model.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24),
          color: AppColors.lighterGray
          ),
          child: ClipRRect(
            borderRadius: BorderRadiusDirectional.circular(24),
            child: CachedNetworkImage(
              imageUrl:product.mainImage.toString() ,
               width: MediaQuery.of(context).size.width / 2.1,
              height: MediaQuery.of(context).size.width / 2,
              fit: BoxFit.fill,
            ), 
            
            
          ),
        ),
        verticalSpace(2),
         Text(
          product.title ??"",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.font18BlackW900,
        ),
        verticalSpace(2),
         Text(
          product.brand.toString(),
          style: AppTextStyles.font12DarkGrayW400,
        ),
        verticalSpace(2),
         Text(
          "\$ ${product.price.toString()}",
          style: AppTextStyles.font16BlackW400,
        ),
      ],
    );
  }



}
