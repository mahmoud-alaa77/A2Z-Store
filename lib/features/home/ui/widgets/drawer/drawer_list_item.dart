import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_text_styles.dart';

class DrawerListItem extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final IconData icon;
  const DrawerListItem(
      {super.key, this.onTap, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            size: 35.r,
          ),
          horizontalSpace(8),
          Text(
            title,
            style: AppTextStyles.font18BlackW900,
          ),
        ],
      ),
    );
  }
}
