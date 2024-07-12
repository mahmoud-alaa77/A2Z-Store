import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:online_store/core/errors/failure.dart';
import 'package:online_store/core/errors/server_failure.dart';
import 'package:online_store/core/networking/api_services.dart';
import 'package:online_store/features/home/data/models/category_model.dart';
import 'package:online_store/features/home/data/models/product_model.dart';

class HomeRepo {
  final ApiServices _apiService;

  HomeRepo({required ApiServices apiService}) : _apiService = apiService;

  Future<Either<Failure, List<CategoryModel>>> getAllCategories() async {
    try {
      var response = await _apiService.getAllCategories();

      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      } else {
        return left(Failure(error.toString()));
      }
    }
  }



  Future<Either<Failure, ProductModel>> getProductsById(String categoryName) async {
    try {
      var response = await _apiService.getProductsByCategoryId( categoryName);

      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      } else {
        return left(Failure(error.toString()));
      }
    }
  }


}
