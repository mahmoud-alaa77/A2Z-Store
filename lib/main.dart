import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/di/dependancy_injection.dart';
import 'package:online_store/core/helpers/my_bloc_observer.dart';
import 'package:online_store/core/routing/app_routing.dart';
import 'package:online_store/store_app.dart';

import 'firebase_options.dart';

void main() async {
  setupGetIt();
    WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await ScreenUtil.ensureScreenSize();
    Bloc.observer = SimpleBlocObserver();
  runApp(A2zStore(
    appRouter: AppRouter(),
  ));
}
