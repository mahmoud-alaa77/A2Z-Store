import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/helpers/database_helper.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_colors.dart';
import 'package:online_store/core/theming/app_text_styles.dart';
import 'package:online_store/features/cart/data/models/cart_model.dart';
import 'package:online_store/features/cart/logic/cubit/cart_cubit.dart';

class CartItem extends StatelessWidget {
  final CartModel productCart;
  const CartItem({super.key, required this.productCart});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(productCart.title),
      onDismissed: (d) {
        DataBaseHelper db = DataBaseHelper();
        db.deleteFromCart(productCart.title);
        context.read<CartCubit>().getCartItems();
      },
      secondaryBackground:
          setBackgroundForDismissbleWidget(AlignmentDirectional.centerEnd),
      background:
          setBackgroundForDismissbleWidget(AlignmentDirectional.centerStart),
      child: Container(
        padding: REdgeInsetsDirectional.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(16),
            border: Border.all(
              width: .3,
            )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(colors: [
                    Colors.white,
                    AppColors.lightGray.withOpacity(.3),
                    Colors.white,
                  ])),
              child: ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(24),
                child: CachedNetworkImage(
                  imageUrl: productCart.image.toString(),
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.width / 3,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  verticalSpace(6),
                  Text(
                    productCart.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.font18BlackW900,
                  ),
                  verticalSpace(6),
                  Text(
                    "${productCart.price.toString()} \$",
                    style: AppTextStyles.font16BlackW400,
                  ),
                  verticalSpace(8),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Container(
                        height: 40.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(8),
                            color: AppColors.lighterGray),
                        child: Center(
                            child: Text(
                          "Quantity: X${productCart.quantity}",
                          style: AppTextStyles.font14BlueW700,
                        ))),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container setBackgroundForDismissbleWidget(AlignmentGeometry alignment) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(16),
        color: AppColors.mainBlack,
      ),
      child: Align(
          alignment: alignment,
          child: Icon(Icons.delete, color: Colors.white, size: 35.r)),
    );
  }
}
