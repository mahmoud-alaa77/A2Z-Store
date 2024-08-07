import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/helpers/constants.dart';
import 'package:online_store/core/helpers/extensions.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/routing/routes.dart';
import 'package:online_store/core/theming/app_colors.dart';
import 'package:online_store/core/theming/app_text_styles.dart';
import 'package:online_store/core/widgets/custom_empty_screen.dart';
import 'package:online_store/core/widgets/custom_text_button.dart';
import 'package:online_store/features/cart/logic/cubit/cart_cubit.dart';
import 'package:online_store/features/cart/ui/widgets/cart_item.dart';
import 'package:online_store/features/search/ui/widgets/search_list_shimmer_loading.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: cartsScreenAppBar(),
          body: BlocBuilder<CartCubit, CartState>(builder: (context, state) {
            if (state is CartLoaded) {
              return state.items.isEmpty
                  ? cartItemsNotFounded(context)
                  : cartItemsFounded(state, context);
            } else if (state is CartError) {
              return Center(
                child: Text(state.error),
              );
            } else {
              return const SearchListShimmerLoading();
            }
          })),
    );
  }
}

AppBar cartsScreenAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("My Cart", style: AppTextStyles.font18BlackW900),
        horizontalSpace(4),
        const Icon(
          Icons.shopping_cart,
          color: AppColors.mainBlack,
          size: 30,
        ),
        horizontalSpace(40),
      ],
    ),
  );
}

Center cartItemsNotFounded(BuildContext context) {
  return Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const CustomEmptyScreen(
        title: "Your cart is empty",
        image: MyAppImages.emptyCartSvgImage,
      ),
      verticalSpace(4),
      TextButton(
        child: Text("Go to shopping",
            style: AppTextStyles.font14BlueW700
                .copyWith(decoration: TextDecoration.underline)),
        onPressed: () {
          context.pushReplacementNamed(Routes.homeScreen);
        },
      )
    ],
  ));
}

Column cartItemsFounded(CartLoaded state, BuildContext context) {
  double totalPrice = BlocProvider.of<CartCubit>(context)
      .calculateTotalPriceInCart(state.items, context);
  int numberOfItems = BlocProvider.of<CartCubit>(context)
      .calculateTotalItemsInCart(state.items);
  return Column(
    children: [
      Expanded(
        flex: 4,
        child: Padding(
          padding:
              const EdgeInsetsDirectional.only(end: 16, start: 16, top: 16),
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return verticalSpace(12);
            },
            itemCount: state.items.length,
            itemBuilder: (context, index) {
              return CartItem(productCart: state.items[index]);
            },
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          padding: const EdgeInsetsDirectional.all(8),
          decoration: const BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(32),
                topStart: Radius.circular(32),
              ),
              color: AppColors.mainBlack),
          width: double.infinity,
          child: Column(
            children: [
              verticalSpace(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Total : $numberOfItems Items",
                    style: AppTextStyles.font16WhiteW700,
                  ),
                  Text("$totalPrice \$", style: AppTextStyles.font16WhiteW700),
                ],
              ),
              verticalSpace(32),
              const CustomTextButton(
                color: Colors.white,
                title: "Proceed to Checkout",
                style: AppTextStyles.font16BlackW400,
                icon: Icons.shopping_cart,
              )
            ],
          ),
        ),
      ),
    ],
  );
}
