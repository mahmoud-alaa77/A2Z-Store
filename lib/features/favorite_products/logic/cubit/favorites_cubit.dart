import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/helpers/constants.dart';
import 'package:online_store/core/helpers/shared_pref_helper.dart';
import 'package:online_store/features/favorite_products/data/models/fav_product_model.dart';
import 'package:online_store/features/favorite_products/data/repo/favorites_repo.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepo _favoritesRepo;
  FavoritesCubit(this._favoritesRepo) : super(FavoritesInitial());

  getFavoriteProducts() async {
    emit(FavoritesLoading());

    var result = await _favoritesRepo.getFavoriteProducts(
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken));

    result.fold((failure) {
      emit(FavoritesError(error: failure.errorMessage));
    }, (products) {
      emit(FavoritesProductsLoaded(products: products ?? []));
    });
  }

  checkIsFavoriteOrNot(String title) async {
    emit(FavoritesLoading());
    var response = await _favoritesRepo.checkIsFavoriteOrNot(title,
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken));
    response.fold((failure) {
      emit(FavoritesError(error: "Please try later !"));
    }, (isSaved) {
      emit(IsFavoriteState(isFavorite: isSaved));
    });
  }
}
