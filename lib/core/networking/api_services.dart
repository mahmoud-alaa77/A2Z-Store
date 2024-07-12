import 'package:dio/dio.dart';
import 'package:online_store/core/networking/api_constants.dart';
import 'package:online_store/features/home/data/models/category_model.dart';
import 'package:online_store/features/home/data/models/product_model.dart';
import 'package:retrofit/http.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @GET(ApiConstants.allCategories)
  Future<List<CategoryModel>> getAllCategories();

  @GET("/category/{categoryName}")
  Future<ProductModel> getProductsByCategoryId(
      @Path("categoryName") String categoryName);
}
