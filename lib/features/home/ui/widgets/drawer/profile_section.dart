
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/helpers/constants.dart';

import '../../../../../core/theming/app_colors.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Align(
      alignment: Alignment.centerLeft,
      child: CircleAvatar(
        backgroundColor: AppColors.lightGray,
        radius: 37.r,
        child: CircleAvatar(
          radius: 35.r,
          backgroundImage: const NetworkImage(
          MyAppImages.defaultUserImage),
        ),
      ),
    ),
    const SizedBox(height: 6),
    const Text(
      "Mahmoud Alaa",
      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18.0),
    ),
    const Text(
      "mahmoud.alaa1212@gmail.com",
      style: TextStyle(color: Colors.grey, fontSize: 12.0),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
  ],
);
  }
}