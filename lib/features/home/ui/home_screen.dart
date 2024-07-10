import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/features/home/ui/widgets/home_body.dart';
import 'package:online_store/features/home/ui/widgets/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: homeAppBar(),
          drawer: const HomeDrawer(),
          body: const HomeScreenBody()
    ));
  }
}



PreferredSizeWidget homeAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
actions:  [
  Padding(
    padding: const EdgeInsetsDirectional.symmetric(horizontal: 20,vertical: 8),
    child: CircleAvatar(
      backgroundImage: const NetworkImage("https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&w=600"),
      radius: 22.r,
      
    
    ),
  )
],
  );
}
