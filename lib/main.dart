import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:online_store/core/di/dependancy_injection.dart';
import 'package:online_store/core/helpers/constants.dart';
import 'package:online_store/core/helpers/my_bloc_observer.dart';
import 'package:online_store/core/helpers/shared_pref_helper.dart';
import 'package:online_store/core/routing/app_routing.dart';
import 'package:online_store/store_app.dart';

import 'firebase_options.dart';

bool isLogedInUser = false;
void main() async {

  setupGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = SimpleBlocObserver();
  await checkIfLogedInUser();
  runApp(A2zStore(
    appRouter: AppRouter(),
  ));
    

}

checkIfLogedInUser() async {
  String? userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  // ignore: unnecessary_null_comparison
  if (userToken != null && userToken.isNotEmpty) {
    isLogedInUser = true;
  } else {
    isLogedInUser = false;
  }
}
