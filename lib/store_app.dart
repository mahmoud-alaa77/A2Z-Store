

import 'package:flutter/material.dart';

import 'core/theming/app_colors.dart';

class A2zStore extends StatelessWidget {
  const A2zStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A2Z STORE',
      theme: ThemeData(
      
        primaryColor: AppColors.mainBlack
      ),
      home: const Scaffold(body:  Column(),)
    );
  }
}