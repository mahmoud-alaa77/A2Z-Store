import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/di/dependancy_injection.dart';
import 'package:online_store/core/routing/routes.dart';
import 'package:online_store/features/home/logic/cubits/categories_cubit/category_cubit.dart';
import 'package:online_store/features/home/logic/cubits/products_cubit/product_cubit.dart';
import 'package:online_store/features/home/ui/home_screen.dart';
import 'package:online_store/features/login/logic/cubit/login_cubit.dart';
import 'package:online_store/features/login/ui/login_screen.dart';
import 'package:online_store/features/on_boarding/ui/on_boarding_screen.dart';
import 'package:online_store/features/sign_up/logic/sign_up_cubit.dart';
import 'package:online_store/features/sign_up/ui/sign_up_screen.dart';

class AppRouter {
  Route? genrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginScreen(),
                ));
      case Routes.signUpScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<SignUpCubit>(),
                  child: const SignUpScreen(),
                ));

      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => getIt<ProductCubit>(),),
                  BlocProvider(
                  create: (context) => getIt<CategoryCubit>()..getAllCategories(),)
              ],
              child: const HomeScreen()));
      default:
        return null;
    }
  }
}
