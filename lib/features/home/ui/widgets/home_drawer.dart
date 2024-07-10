
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 24,vertical: 16
            ),
            child: Drawer(
              shape:StadiumBorder() ,
            ),
          );
  }
}