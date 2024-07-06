import 'package:flutter/material.dart';
import 'package:online_store/core/routing/routes.dart';
import 'package:online_store/features/login/ui/widgets/login_screen.dart';
import 'package:online_store/features/on_boarding/ui/on_boarding_screen.dart';
import 'package:online_store/features/sign_up/ui/sign_up_screen.dart';

class AppRouter {
  Route? genrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
         case Routes.signUpScreen:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      default:
        return null;
    }
  }
}
