import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:online_store/core/networking/api_services.dart';
import 'package:online_store/features/home/data/repos/home_repo.dart';
import 'package:online_store/features/home/logic/cubits/categories_cubit/category_cubit.dart';
import 'package:online_store/features/home/logic/cubits/products_cubit/product_cubit.dart';
import 'package:online_store/features/login/data/repos/login_repo.dart';
import 'package:online_store/features/login/logic/cubit/login_cubit.dart';
import 'package:online_store/features/search/data/repos/search_repo.dart';
import 'package:online_store/features/search/logic/cubit/search_cubit.dart';
import 'package:online_store/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:online_store/features/sign_up/logic/sign_up_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //firebase

  getIt.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );

  //Api Service

  getIt.registerLazySingleton<ApiServices>(
    () => ApiServices(createAndSetUpDio()),
  );

  // signup
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //home

  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(apiService: getIt()));
  getIt.registerFactory<ProductCubit>(() => ProductCubit(getIt())..getProductsByCategoryId("beauty"));
   getIt.registerFactory<CategoryCubit>(() => CategoryCubit(getIt()));

   //search

  getIt.registerLazySingleton<SearchRepo>(() => SearchRepo( getIt()));
   getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt()));
}

Dio createAndSetUpDio() {
  Dio dio = Dio();
  dio
    ..options.connectTimeout = const Duration(seconds: 30)
    ..options.receiveTimeout = const Duration(seconds: 30);

  dio.interceptors.add(LogInterceptor(
    error: true,
    requestBody: true,
    request: true,
    responseBody: true,
    requestHeader: false,
    responseHeader: false,
  ));
  return dio;
}
