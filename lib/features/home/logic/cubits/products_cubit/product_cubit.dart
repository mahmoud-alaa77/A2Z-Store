import 'package:online_store/features/home/data/models/product_model.dart';
import 'package:online_store/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final HomeRepo _homeRepo;
  ProductCubit(this._homeRepo) : super(ProductsInitial());

  getProductsByCategoryId(String categoryName) async {
    emit(ProductsLoading());

    var response = await _homeRepo.getProductsById(categoryName);

    response.fold((failure) {
      emit(ProductsLoadedFailure(message: failure.errorMessage));
    }, (products) {
      emit(ProductsLoadedSuccess(products));
    });
  }
}
