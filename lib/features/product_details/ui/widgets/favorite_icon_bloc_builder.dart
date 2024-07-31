import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/helpers/constants.dart';
import 'package:online_store/core/helpers/database_helper.dart';
import 'package:online_store/core/helpers/shared_pref_helper.dart';
import 'package:online_store/core/widgets/app_icon_button.dart';
import 'package:online_store/features/favorite_products/logic/cubit/favorites_cubit.dart';
import 'package:online_store/features/home/data/models/product_model.dart';

class FavoritesIconBlocBuilder extends StatelessWidget {
  final Product product;
  const FavoritesIconBlocBuilder({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state is IsFavoriteState) {
          return AppIconButton(
            icon: Icons.favorite_rounded,
            iconColor: state.isFavorite
                ? Colors.red
                : const Color.fromARGB(255, 255, 255, 255),
            size: 40.w,
            onPressed: (){
              checkIfProductIsFavoriteOrNot(state, product, context);
          
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
    );
  }
  void checkIfProductIsFavoriteOrNot(state,Product product,context) async {
    final db = DataBaseHelper();
// if product is favorite --> delete it from favorites
// if product is not favorite --> add it to favorites

    state.isFavorite
        ? db.deleteFromFavorites(product.title.toString())
        : db.addProductToFavorites(product,
            await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken));
    BlocProvider.of<FavoritesCubit>(context)
        .checkIsFavoriteOrNot(product.title.toString());
  }
}
