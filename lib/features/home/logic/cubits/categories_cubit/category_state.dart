part of 'category_cubit.dart';

sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoriesLoading extends CategoryState {}

final class CategoriesLoadedSuccess extends CategoryState {
  final List<CategoryModel> categories;

  CategoriesLoadedSuccess(this.categories);
}

final class CategoriesLoadedFailure extends CategoryState {
  final String message;

  CategoriesLoadedFailure({required this.message});
}
