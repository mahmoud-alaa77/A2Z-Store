import 'package:flutter/material.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_text_styles.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusDirectional.circular(24),
          child: Image.network(
            "https://api.escuelajs.co/api/v1/files/fb46.png",
            width: MediaQuery.of(context).size.width / 2.1,
            height: MediaQuery.of(context).size.width / 2,
            fit: BoxFit.fill,
          ),
        ),
        verticalSpace(2),
        const Text(
          "Axel Arigato",
          style: AppTextStyles.font18BlackW900,
        ),
        verticalSpace(2),
        const Text(
          "Clean 90 Triple sneakers",
          style: AppTextStyles.font12DarkGrayW400,
        ),
        verticalSpace(2),
        const Text(
          "\$ 450.00",
          style: AppTextStyles.font16BlackW400,
        ),
      ],
    );
  }
}
