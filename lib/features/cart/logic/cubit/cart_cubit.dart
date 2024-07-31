import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:online_store/core/helpers/constants.dart';
import 'package:online_store/core/helpers/database_helper.dart';
import 'package:online_store/core/helpers/functions.dart';
import 'package:online_store/core/helpers/shared_pref_helper.dart';
import 'package:online_store/features/cart/data/models/cart_model.dart';
import 'package:online_store/features/cart/data/repos/cart_repo.dart';
import 'package:online_store/features/home/data/models/product_model.dart';
import 'package:toast/toast.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;
  final DataBaseHelper db;

  CartCubit(this.db, this.cartRepo) : super(CartInitial());

  int quntity = 1;

  void addOne() {
    if (quntity >= 1) {
      emit(CartChangeed(quantity: quntity++));
    }
  }

  void minusOne() {
    if (quntity > 1) {
      emit(CartChangeed(quantity: quntity--));
    }
  }

  void addToCart(Product product, int quantity) async {
    try {
      CartModel newCart = CartModel(
        productId: product.id!.toInt(),
        image: product.mainImage.toString(),
        title: product.title.toString(),
        price: product.price!.toDouble(),
        quantity: quantity,
        userId:
            await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken),
      );
      db.addProductToCart(newCart);

      Toast.show("Add Successfully",
          duration: Toast.lengthShort, gravity: Toast.bottom);
    } catch (e) {
      Toast.show("Failed to add to cart",
          duration: Toast.lengthShort, gravity: Toast.bottom);
    }
  }

  getCartItems() async {
    emit(CartLoading());

    var result = await cartRepo.getFavoriteProducts();
    result.fold((failure) {
      emit(CartError(error: failure.errorMessage));
    }, (items) {
      emit(CartLoaded(items: items ?? []));
    });
  }

  checkIsCartItem(String title) async {
    emit(CartLoading());
    var response = await cartRepo.checkIsCartItemOrNot(title);
    response.fold((failure) {
      emit(CartError(error: "Please try later !"));
    }, (cartItem) {
      emit(CartIsACartItem(isCartItem: cartItem));
    });
  }

  Future<void> addAndUpdateCart(
      BuildContext context, String productTitle, Product product) async {
    DataBaseHelper dataBaseHelper = DataBaseHelper();
    if (await dataBaseHelper.isCartItem(
            productTitle,
            await SharedPrefHelper.getSecuredString(
                SharedPrefKeys.userToken)) ==
        true) {
      DataBaseHelper db = DataBaseHelper();
      db.deleteFromCart(productTitle);
      addToCart(product, quntity);
    } else {
      addToCart(product, quntity);
    }
  }

  double calculateTotalPriceInCart(items,context) {
    double total = 0;
    for (CartModel cart in items) {
      total += cart.price * cart.quantity;
    }
   return HelperFunctions().convertDoubleNumber(context, total);
   
  }

  int calculateTotalItemsInCart(items) {
    int total = 0;
    for (CartModel cart in items) {
      total += cart.quantity;
    }
    return total;
  }
}
