part of 'product_cubit.dart';

sealed class ProductState {}

final class ProductsInitial extends ProductState {}

final class ProductsLoading extends ProductState {}

final class ProductsLoadedSuccess extends ProductState {
  final ProductModel productsResponse;

  ProductsLoadedSuccess(this.productsResponse);
}

final class ProductsLoadedFailure extends ProductState {
  final String message;

  ProductsLoadedFailure({required this.message});
}
