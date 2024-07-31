import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:online_store/core/helpers/database_helper.dart';
import 'package:online_store/core/networking/api_services.dart';
import 'package:online_store/features/cart/data/repos/cart_repo.dart';
import 'package:online_store/features/cart/logic/cubit/cart_cubit.dart';
import 'package:online_store/features/favorite_products/data/repo/favorites_repo.dart';
import 'package:online_store/features/favorite_products/logic/cubit/favorites_cubit.dart';
import 'package:online_store/features/home/data/repos/home_repo.dart';
import 'package:online_store/features/home/logic/cubits/categories_cubit/category_cubit.dart';
import 'package:online_store/features/home/logic/cubits/products_cubit/product_cubit.dart';
import 'package:online_store/features/login/data/repos/login_repo.dart';
import 'package:online_store/features/login/logic/cubit/login_cubit.dart';
import 'package:online_store/features/home/data/repos/profile_repo.dart';
import 'package:online_store/features/home/logic/cubits/profile_cubit/profile_cubit.dart';
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
  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

//local database
  getIt.registerFactory<DataBaseHelper>(
    () => DataBaseHelper(),
  );

  //Api Service

  getIt.registerLazySingleton<ApiServices>(
    () => ApiServices(createAndSetUpDio()),
  );

  // signup
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt(), getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt(), getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //home

  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(apiService: getIt()));
  getIt.registerFactory<ProductCubit>(
      () => ProductCubit(getIt())..getProductsByCategoryId("beauty"));
  getIt.registerFactory<CategoryCubit>(() => CategoryCubit(getIt()));

//profile
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));

  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt()));

  //search

  getIt.registerLazySingleton<SearchRepo>(() => SearchRepo(getIt()));
  getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt()));

  //favorites Products

  getIt.registerLazySingleton<FavoritesRepo>(() => FavoritesRepo(getIt()));
  getIt.registerFactory<FavoritesCubit>(() => FavoritesCubit(getIt()));

  //cart
  getIt.registerFactory<CartRepo>(() => CartRepo(getIt()));
  getIt.registerFactory<CartCubit>(() => CartCubit(getIt(), getIt()));
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
