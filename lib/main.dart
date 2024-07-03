import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/routing/app_routing.dart';
import 'package:online_store/store_app.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(A2zStore(
    appRouter: AppRouter(),
  ));
}
