
import 'package:online_store/features/home/data/models/category_model.dart';
import 'package:online_store/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final HomeRepo _homeRepo;
  CategoryCubit(this._homeRepo) : super(CategoryInitial());
getAllCategories() async {
    emit(CategoriesLoading());

    var response = await _homeRepo.getAllCategories();

    response.fold((failure) {
      emit(CategoriesLoadedFailure(message: failure.errorMessage));
    }, (categories) {
      emit(CategoriesLoadedSuccess(categories));
    });
  }


}
