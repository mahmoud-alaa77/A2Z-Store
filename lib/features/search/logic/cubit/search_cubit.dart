import 'package:online_store/features/home/data/models/product_model.dart';
import 'package:online_store/features/search/data/repos/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _searchRepo;

  SearchCubit(this._searchRepo) : super(SearchInitial());
  List<Product> productsList = [];
  bool isFiltered = false;

  searchByValue(String value) async {
    emit(SearchLoading());

    var response = await _searchRepo.searchByName(value);

    response.fold(
      (failure) {
        emit(SearchError(message: failure.errorMessage));
      },
      (products) {
        List<Product> allProducts = products.products;
        emit(SearchSuccessful(
            productsList: isFiltered ? productsList : allProducts));
      },
    );
  }

  searchAndFilterByPriceRange(String value, double start, double end) async {
    emit(SearchLoading());

    var response = await _searchRepo.searchByName(value);

    response.fold(
      (failure) {
        emit(SearchError(message: failure.errorMessage));
      },
      (products) {
        List<Product> allProducts = products.products;
        for (var i = 0; i < allProducts.length; i++) {
          if (allProducts.isNotEmpty) {
            if (allProducts[i].price! >= start &&
                allProducts[i].price! <= end) {
              productsList.add(allProducts[i]);
            }
          }
        }
        emit(SearchSuccessful(productsList: productsList));
      },
    );
  }
}
