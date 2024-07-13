import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/helpers/extensions.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/routing/routes.dart';
import 'package:online_store/core/theming/app_colors.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.searchScreen);
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 100.w,
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(40),
          color: AppColors.lighterGray,
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              size: 30.r,
            ),
            horizontalSpace(10),
            const Text("Search Here..."),
          ],
        ),
      ),
    );
  }
}
