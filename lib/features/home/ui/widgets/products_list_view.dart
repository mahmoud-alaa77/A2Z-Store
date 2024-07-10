import 'package:flutter/material.dart';
import 'package:online_store/features/home/ui/widgets/product_item.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, 
          mainAxisSpacing: 0,
          crossAxisSpacing: 12, 
          childAspectRatio: 9 / 15),
      itemCount: 20, 
      itemBuilder: (context, index) {
        return const ProductItem();
      },
    );
  }
}
