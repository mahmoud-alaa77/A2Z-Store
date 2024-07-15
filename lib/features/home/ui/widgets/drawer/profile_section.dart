
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              "https://scontent.fcai20-5.fna.fbcdn.net/v/t39.30808-1/448371764_3714473575432444_5601875214711833416_n.jpg?stp=dst-jpg_p200x200&_nc_cat=102&ccb=1-7&_nc_sid=0ecb9b&_nc_ohc=C82z_roC7iMQ7kNvgE7Yk8v&_nc_ht=scontent.fcai20-5.fna&oh=00_AYAiqVgkOM8aXHSj6U3fDzqIRPWvGLPQnodXDQWeRw1pJg&oe=669AC3EC"),
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