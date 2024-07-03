import 'package:flutter/material.dart';
import 'package:online_store/core/routing/routes.dart';
import 'package:online_store/features/on_boarding/ui/on_boarding_screen.dart';

class AppRouter {
  Route? genrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());

      default:
        return null;
    }
  }
}
