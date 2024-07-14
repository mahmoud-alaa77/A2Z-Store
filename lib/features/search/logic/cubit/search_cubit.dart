import 'package:flutter/material.dart';
import 'package:online_store/features/home/data/models/product_model.dart';
import 'package:online_store/features/search/data/repos/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _searchRepo;

  SearchCubit(this._searchRepo) : super(SearchInitial());

  searchByValue(String value) async {
    emit(SearchLoading());

    var response = await _searchRepo.searchByName(value);

    response.fold(
      (failure) {
        emit(SearchError(message: failure.errorMessage));
      },
      (products) {
        emit(SearchSuccessful(productModel: products));
      },
    );
  }
}
