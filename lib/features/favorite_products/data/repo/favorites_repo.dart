import 'package:dartz/dartz.dart';
import 'package:online_store/core/errors/failure.dart';
import 'package:online_store/core/helpers/database_helper.dart';
import 'package:online_store/features/favorite_products/data/models/fav_product_model.dart';

class FavoritesRepo {
  final DataBaseHelper _dataBaseHelper;

  FavoritesRepo(this._dataBaseHelper);

  Future<Either<Failure, List<FavProductModel>?>> getFavoriteProducts(
      String userId) async {
    try {
      var products = await _dataBaseHelper.getFavoriteProducts(userId);
      return Right(products);
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }

  checkIsFavoriteOrNot(String title, String userId) async {
    try {
      final product = await _dataBaseHelper.isFavorite(title, userId);
      //await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken)
      return Right(product);
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }
}
