import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/helpers/constants.dart';
import 'package:online_store/core/helpers/database_helper.dart';
import 'package:online_store/core/helpers/shared_pref_helper.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_colors.dart';
import 'package:online_store/core/theming/app_text_styles.dart';
import 'package:online_store/core/widgets/app_icon_button.dart';
import 'package:online_store/core/widgets/custom_text_button.dart';
import 'package:online_store/features/favorite_products/logic/cubit/favorites_cubit.dart';
import 'package:online_store/features/home/data/models/product_model.dart';
import 'package:online_store/features/product_details/ui/widgets/category_and_brand.dart';
import 'package:online_store/features/product_details/ui/widgets/displaying_image_widget.dart';
import 'package:online_store/features/product_details/ui/widgets/list_of_reviews.dart';
import 'package:online_store/features/product_details/ui/widgets/list_of_tags.dart';
import 'package:online_store/features/product_details/ui/widgets/rating_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    BlocProvider.of<FavoritesCubit>(context)
        .checkIsFavoriteOrNot(widget.product.title.toString());
    super.initState();
  }

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
                        images: widget.product.images,
                        lengthOfImagesList: widget.product.images!.length,
                      ),
                      verticalSpace(16),
                      CategoryAndBrand(
                        category: widget.product.category.toString(),
                        brand: widget.product.brand.toString(),
                      ),
                      verticalSpace(12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              widget.product.title.toString(),
                              style: AppTextStyles.font18BlackW900
                                  .copyWith(fontSize: 20),
                            ),
                          ),
                          BlocBuilder<FavoritesCubit, FavoritesState>(
                            builder: (context, state) {
                              if (state is IsFavoriteState) {
                                return AppIconButton(
                                  icon: Icons.favorite_rounded,
                                  iconColor: state.isFavorite
                                      ? Colors.red
                                      : const Color.fromARGB(
                                          255, 255, 255, 255),
                                  size: 40.w,
                                  onPressed: () async {
                                    final db = DataBaseHelper();
// if product is favorite --> delete it from favorites
// if product is not favorite --> add it to favorites

                                    state.isFavorite
                                        ? db.delete(
                                            widget.product.title.toString())
                                        : db.saveItem(
                                            widget.product,
                                            await SharedPrefHelper
                                                .getSecuredString(
                                                    SharedPrefKeys.userToken));
                                    BlocProvider.of<FavoritesCubit>(context)
                                        .checkIsFavoriteOrNot(
                                            widget.product.title.toString());
                                  },
                                );
                              } else {
                                return AppIconButton(
                                  icon: Icons.favorite,
                                  iconColor: Colors.transparent,
                                  size: 40.w,
                                  onPressed: () {},
                                );
                              }
                            },
                          ),
                        ],
                      ),
                      verticalSpace(8),
                      widget.product.tags == null
                          ? const SizedBox.shrink()
                          : ListOfTags(
                              product: widget.product,
                            ),
                      verticalSpace(12),
                      RatingWidget(
                          ratingValue: widget.product.rating!.toDouble(),
                          numsOfReview: widget.product.reviews!.length),
                      verticalSpace(12),
                      Text(
                        "Description",
                        style: AppTextStyles.font16BlackW400
                            .copyWith(fontSize: 18),
                      ),
                      verticalSpace(8),
                      Text(widget.product.description.toString(),
                          style: AppTextStyles.font16BlackW400
                              .copyWith(color: AppColors.darkGray)),
                      verticalSpace(25),
                      Row(
                        children: [
                          Text(
                            "Total Price: \$${widget.product.price}\nDiscount: %9.25",
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
                        product: widget.product,
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
