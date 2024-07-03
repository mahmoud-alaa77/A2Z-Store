import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_text_styles.dart';

class OnBoardingPageBody extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String desc;

  const OnBoardingPageBody(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.desc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusDirectional.circular(36),
            child: ClipPath(
                clipper: MyClipper(),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 450.h,
                  width: double.infinity,
                )),
          ),
          verticalSpace(24),
          Text(
            title,
            style: AppTextStyles.font24BlackW900,
          ),
          verticalSpace(24),
          Text(
            desc,
            style: AppTextStyles.font18LightGrayW400,
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height - 50.h);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
