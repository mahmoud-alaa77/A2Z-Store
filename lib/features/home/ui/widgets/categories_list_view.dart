import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_text_styles.dart';

import '../../../../core/theming/app_colors.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key});

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 120.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              child: Column(
                children: [
                  currentIndex == index
                      ? CircleAvatar(
                          radius: 34.r,
                          backgroundColor: AppColors.mainBlack,
                          child: CircleAvatar(
                            backgroundImage: const NetworkImage(
                                "https://i.imgur.com/ZANVnHE.jpeg"),
                            radius: 32.r,
                          ),
                        )
                      : CircleAvatar(
                          backgroundImage: const NetworkImage(
                              "https://i.imgur.com/ZANVnHE.jpeg"),
                          radius: 30.r,
                        ),
                  verticalSpace(8),
                  Text(
                    "Genral",
                    style: currentIndex == index
                        ? AppTextStyles.font16BlackW400
                            .copyWith(fontSize: 17, fontWeight: FontWeight.w700)
                        : AppTextStyles.font16BlackW400,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}



