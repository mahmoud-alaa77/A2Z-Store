import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:online_store/core/helpers/extensions.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/routing/routes.dart';
import 'package:online_store/features/home/ui/widgets/drawer/drawer_list_item.dart';
import 'package:online_store/features/home/ui/widgets/drawer/profile_section.dart';

class DrawerMenu extends StatefulWidget {
  final Animation<Offset> position;
  final Animation<double> scale;
  const DrawerMenu({super.key, required this.position, required this.scale});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  //  @override
  //    initState(){
  //   super.initState();
  //   BlocProvider.of<ProfileCubit>(context);
  // }
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: widget.position,
      child: ScaleTransition(
        scale: widget.scale,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 ProfileSection(),
                verticalSpace(32),
                DrawerListItem(
                  title: "Edit Profile",
                  onTap: () {
                    // Navigate to EditProfileScreen
                  },
                  icon: Icons.person_pin,
                ),
                verticalSpace(12),
                DrawerListItem(
                  title: 'Favorite products',
                  onTap: () {
                    // Navigate to favoriteProductsScreen
                  },
                  icon: Icons.favorite_border,
                ),
                verticalSpace(12),
                DrawerListItem(
                  title: 'Cart',
                  onTap: () {
                    // Navigate to CartScreen
                  },
                  icon: Icons.shopping_cart_outlined,
                ),
                verticalSpace(12),
                DrawerListItem(
                  title: 'Settings',
                  onTap: () {
                    // Navigate to SettingsScreen
                  },
                  icon: Icons.settings,
                ),
                verticalSpace(12),
                DrawerListItem(
                  title: 'Log out',
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    await GoogleSignIn().signOut();
                    //await SharedPrefHelper.clearAllSecuredData();
                    context.pushReplacementNamed(Routes.loginScreen);
                  },
                  icon: Icons.login_outlined,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
