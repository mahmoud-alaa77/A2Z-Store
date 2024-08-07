part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccessful extends SearchState {
  final List<Product> productsList;

  SearchSuccessful({required this.productsList});
}

final class SearchError extends SearchState {
  final String message;

  SearchError({required this.message});
}
