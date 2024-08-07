import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/helpers/extensions.dart';
import 'package:online_store/core/routing/routes.dart';
import 'package:online_store/core/theming/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
              onPressed: () async {
                context.pushReplacementNamed(Routes.homeScreen);
                //await context.read<ProfileCubit>().loadProfileData();
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 40.r,
              )),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Edit",
                style: AppTextStyles.font18BlackW900,
              ),
              Text(
                "Profile",
                style: AppTextStyles.font20BlackW700,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
