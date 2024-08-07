import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/helpers/extensions.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/routing/routes.dart';
import 'package:online_store/core/theming/app_colors.dart';
import 'package:online_store/features/home/logic/cubits/products_cubit/product_cubit.dart';
import 'package:online_store/features/home/ui/widgets/products/product_item.dart';
import 'package:online_store/features/home/ui/widgets/products/products_shimmer_loading.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      buildWhen: (previous, current) =>
          current is ProductsLoadedFailure ||
          current is ProductsLoadedSuccess ||
          current is ProductsLoading,
      builder: (context, state) {
        if (state is ProductsLoadedSuccess) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 12,
                childAspectRatio: 9 / 15),
            itemCount: state.productsResponse.products.length,
            itemBuilder: (context, index) {
              return ProductItem(
                product: state.productsResponse.products[index],
                onTap: () {
                  context.pushNamed(Routes.productDetailsScreen ,arguments: state.productsResponse.products[index]);
                },
              );
            },
          );
        } else if (state is ProductsLoadedFailure) {
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.signal_wifi_connected_no_internet_4_sharp,size: 35.r,),
                horizontalSpace(6),
                Text(state.message),
              ],
            ),
          );
        } else {
          return const ProductsShimmerLoading();
        }
      },
    );
  }
}


/*


GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 12,
                childAspectRatio: 9 / 15),
            itemCount: 10,
            itemBuilder: (context, index) {
              return ProductItem(
                product: state.products[index],
              );
            },
          )

          */