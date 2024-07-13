import 'package:flutter/material.dart';
import 'package:online_store/core/theming/app_text_styles.dart';
import 'package:online_store/features/home/data/models/product_model.dart';

class ListOfTags extends StatelessWidget {
  final Product product;
  const ListOfTags({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: product.tags?.length,
        itemBuilder: (context, index) {
          return Text(
            "#${product.tags![index].toString()}  ",
            style: AppTextStyles.font14BlueW700,
          );
        },
      ),
    );
  }
}
