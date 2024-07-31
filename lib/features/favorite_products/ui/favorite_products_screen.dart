import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/helpers/constants.dart';
import 'package:online_store/core/helpers/database_helper.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_colors.dart';
import 'package:online_store/core/theming/app_text_styles.dart';
import 'package:online_store/core/widgets/custom_empty_screen.dart';
import 'package:online_store/features/favorite_products/logic/cubit/favorites_cubit.dart';
import 'package:online_store/features/favorite_products/ui/widgets/favorite_product_item.dart';
import 'package:online_store/features/search/ui/widgets/search_list_shimmer_loading.dart';

class FavoriteProductsScreen extends StatelessWidget {
  const FavoriteProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: favoritesAppBar(),
          body: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 24, vertical: 16),
            child: BlocBuilder<FavoritesCubit, FavoritesState>(
                builder: (context, state) {
              if (state is FavoritesProductsLoaded) {
                return state.products.isEmpty
                    ? favoriteProductsNotFounded()
                    : favoritProductsFounded(state);
              } else if (state is FavoritesError) {
                return Center(
                  child: Text(state.error),
                );
              } else {
                return const SearchListShimmerLoading();
              }
            }),
          )),
    );
  }

  AppBar favoritesAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          horizontalSpace(24),
          const Text("My Favorite Products",
              style: AppTextStyles.font18BlackW900),
          horizontalSpace(4),
          const Icon(
            Icons.favorite,
            color: AppColors.mainBlack,
            size: 30,
          ),
        ],
      ),
    );
  }

  Center favoriteProductsNotFounded() {
    return const Center(
        child: CustomEmptyScreen(title: "No Favorite Products Founded",image: MyAppImages.noDataSvgImage,));
  }

  ListView favoritProductsFounded(FavoritesProductsLoaded state) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 20,
        );
      },
      itemCount: state.products.length,
      itemBuilder: (context, index) {
        return FavoriteProductItem(
          product: state.products[index],
          onPressed: () {
            DataBaseHelper()
                .deleteFromFavorites(state.products[index].title.toString());
            context.read<FavoritesCubit>().getFavoriteProducts();
          },
        );
      },
    );
  }
}
