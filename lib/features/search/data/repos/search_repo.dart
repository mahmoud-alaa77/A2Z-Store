import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:online_store/core/errors/failure.dart';
import 'package:online_store/core/errors/server_failure.dart';
import 'package:online_store/core/networking/api_services.dart';
import 'package:online_store/features/home/data/models/product_model.dart';

 class SearchRepo {
  final ApiServices _apiServices;
  SearchRepo(this._apiServices);

  Future<Either<Failure, ProductModel>> searchByName(String title) async {

    try {
          final response = await _apiServices.searchByName(title);

      return Right(response);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      } else {
        return left(Failure(error.toString()));
      }
    }
  }
}
