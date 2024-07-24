part of 'favorites_cubit.dart';

sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesProductsLoaded extends FavoritesState {
  final List<FavProductModel> products;

  FavoritesProductsLoaded({required this.products});
}

final class FavoritesError extends FavoritesState {
  final String error;

  FavoritesError({required this.error});
}

final class FavoritesLoading extends FavoritesState {}

final class IsFavoriteState extends FavoritesState {
  final bool isFavorite;
  IsFavoriteState({required this.isFavorite});
}
