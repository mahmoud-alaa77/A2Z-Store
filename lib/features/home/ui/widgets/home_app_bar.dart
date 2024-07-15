import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/theming/app_colors.dart';

class HomeAppBar extends StatelessWidget {
  final void Function()? onTap;
  const HomeAppBar({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        InkWell(
          onTap: onTap,
          child:  Icon(Icons.format_align_left_rounded, color: AppColors.mainBlack,size: 35.r,),
        ),
        CircleAvatar(
          backgroundColor: AppColors.darkGray,
          radius: 26.r,
          child: const CircleAvatar(
            
            backgroundColor: AppColors.lighterGray,
            backgroundImage: NetworkImage("https://scontent.fcai20-5.fna.fbcdn.net/v/t39.30808-1/448371764_3714473575432444_5601875214711833416_n.jpg?stp=dst-jpg_p200x200&_nc_cat=102&ccb=1-7&_nc_sid=0ecb9b&_nc_ohc=C82z_roC7iMQ7kNvgE7Yk8v&_nc_ht=scontent.fcai20-5.fna&oh=00_AYAiqVgkOM8aXHSj6U3fDzqIRPWvGLPQnodXDQWeRw1pJg&oe=669AC3EC"),
            radius: 25.0,
          ),
        ),
      ],
    );
  }
}
