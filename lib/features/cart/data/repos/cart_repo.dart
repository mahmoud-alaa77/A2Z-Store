import 'package:dartz/dartz.dart';
import 'package:online_store/core/errors/failure.dart';
import 'package:online_store/core/helpers/constants.dart';
import 'package:online_store/core/helpers/database_helper.dart';
import 'package:online_store/core/helpers/shared_pref_helper.dart';
import 'package:online_store/features/cart/data/models/cart_model.dart';

class CartRepo {
  final DataBaseHelper db;
  CartRepo(this.db);

  Future<Either<Failure, List<CartModel>?>> getFavoriteProducts() async {
    try {
      var items = await db.getItemsFromCart(
          await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken));
      return Right(items);
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }

  // Future<Either<Failure, int>> updateCart(CartModel cart,int newQuantity) async {
  //   try {
  //    int record= await db.updateCart(cart,newQuantity);
  //     return Right(record);
  //   } catch (error) {
  //     return Left(Failure(error.toString()));
  //   }
  // }


Future<Either<Failure, bool>> checkIsCartItemOrNot(String title) async {
    try {
      final record = await db.isFavoriteProduct(title,  await SharedPrefHelper.getSecuredString(
                                            SharedPrefKeys.userToken));
      return Right(record);
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }

}
