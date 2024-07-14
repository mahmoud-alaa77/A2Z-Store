import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/helpers/extensions.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_colors.dart';
import 'package:online_store/features/home/data/models/product_model.dart';
import 'package:online_store/features/home/ui/widgets/products/product_item.dart';
import 'package:online_store/features/search/logic/cubit/search_cubit.dart';
import 'package:online_store/features/search/ui/widgets/custom_search_widget.dart';
import 'package:online_store/features/search/ui/widgets/search_bloc_builder.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            verticalSpace(24),
            Row(
              children: [
                Container(
                  padding: const EdgeInsetsDirectional.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(20),
                      color: AppColors.lighterGray),
                  child: IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(Icons.arrow_back_rounded)),
                ),
                horizontalSpace(8),
                Expanded(child: CustomSearchWidget(
                  onChanged: (value) {
                    context.read<SearchCubit>().searchByValue(value);
                  },
                )),
              ],
            ),
            verticalSpace(24),
            const SearchBlocBuilder(),
          ],
        ),
      )),
    );
  }
}
