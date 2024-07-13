import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_colors.dart';
import 'package:online_store/core/theming/app_text_styles.dart';
import 'package:online_store/core/widgets/app_icon_button.dart';
import 'package:online_store/core/widgets/custom_text_button.dart';
import 'package:online_store/features/home/data/models/product_model.dart';
import 'package:online_store/features/product_details/ui/widgets/category_and_brand.dart';
import 'package:online_store/features/product_details/ui/widgets/displaying_image_widget.dart';
import 'package:online_store/features/product_details/ui/widgets/list_of_reviews.dart';
import 'package:online_store/features/product_details/ui/widgets/list_of_tags.dart';
import 'package:online_store/features/product_details/ui/widgets/rating_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
            child: CustomScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(12),
                      DisplayingImagesWidget(
                        images: product.images,
                        lengthOfImagesList: product.images!.length,
                      ),
                      verticalSpace(16),
                      CategoryAndBrand(
                        category: product.category.toString(),
                        brand: product.brand.toString(),
                      ),
                      verticalSpace(12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              product.title.toString(),
                              style: AppTextStyles.font18BlackW900
                                  .copyWith(fontSize: 20),
                            ),
                          ),
                          AppIconButton(
                            icon: Icons.favorite_sharp,
                            iconColor: Colors.red,
                            size: 40.w,
                            onPressed: () {},
                          ),
                        ],
                      ),
                      verticalSpace(8),
                      product.tags == null
                          ? const SizedBox.shrink()
                          : ListOfTags(
                              product: product,
                            ),
                      verticalSpace(12),
                      RatingWidget(
                          ratingValue: product.rating!.toDouble(),
                          numsOfReview: product.reviews!.length),
                      verticalSpace(12),
                      Text(
                        "Description",
                        style: AppTextStyles.font16BlackW400
                            .copyWith(fontSize: 18),
                      ),
                      verticalSpace(8),
                      Text(product.description.toString(),
                          style: AppTextStyles.font16BlackW400
                              .copyWith(color: AppColors.darkGray)),
                      verticalSpace(25),
                      Row(
                        children: [
                          Text(
                            "Total Price: \$${product.price}\nDiscount: %9.25",
                            style: AppTextStyles.font16BlackW400,
                          ),
                          horizontalSpace(12),
                          const Expanded(
                            child: CustomTextButton(
                              title: "Add to cart",
                              icon: Icons.shopping_cart,
                              iconColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(25),
                      Text(
                        "Reviews",
                        style: AppTextStyles.font16BlackW400
                            .copyWith(fontSize: 18),
                      ),
                      verticalSpace(16),
                      ListOfReviews(
                        product: product,
                      ),
                      verticalSpace(20),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
