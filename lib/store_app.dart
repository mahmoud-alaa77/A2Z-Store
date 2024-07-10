import 'package:flutter/material.dart';
import 'package:online_store/core/routing/app_routing.dart';
import 'package:online_store/core/routing/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/theming/app_colors.dart';

class A2zStore extends StatelessWidget {
  final AppRouter appRouter;
  const A2zStore({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392, 872),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'A2Z STORE',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primaryColor: AppColors.mainBlack,
            fontFamily: "Margarine"
            ),
        initialRoute: Routes.homeScreen,
        onGenerateRoute: appRouter.genrateRoute,
      ),
    );
  }
}
