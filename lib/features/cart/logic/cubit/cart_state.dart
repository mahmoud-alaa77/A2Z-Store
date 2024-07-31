part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final List<CartModel> items;
  CartLoaded({required this.items});
}

final class CartError extends CartState {
  final String error;
  CartError({required this.error});
}

final class CartIsACartItem extends CartState {
  final bool isCartItem;

  CartIsACartItem({required this.isCartItem});
}

final class CartChangeed extends CartState {
  final int quantity;

  CartChangeed({required this.quantity});
}
