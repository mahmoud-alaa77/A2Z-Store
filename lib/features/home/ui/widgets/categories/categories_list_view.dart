import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/theming/app_text_styles.dart';
import 'package:online_store/features/home/logic/cubits/categories_cubit/category_cubit.dart';
import 'package:online_store/features/home/logic/cubits/products_cubit/product_cubit.dart';
import 'package:online_store/features/home/ui/widgets/categories/category_shimmer_loading.dart';

import '../../../../../core/theming/app_colors.dart';

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
      height: 42.h,
      child: BlocBuilder<CategoryCubit, CategoryState>(
        buildWhen: (previous, current) =>
            current is CategoriesLoadedFailure ||
            current is CategoriesLoadedSuccess ||
            current is CategoriesLoading,
        builder: (context, state) {
          if (state is CategoriesLoadedSuccess) {
           // context.read<ProductCubit>().getProductsByCategoryId(state.categories.first.lowercaseName);
            return setCategoriesLoaded(state);
          } else if (state is CategoriesLoadedFailure) {
            return Center(child: Text(state.message));
          } else {
            return const CategoryShimmerLoading();
          }
        },
      ),
    );
  }

  ListView setCategoriesLoaded(CategoriesLoadedSuccess state) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: state.categories.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 8),
          child: GestureDetector(
            onTap: () {
              context.read<ProductCubit>().getProductsByCategoryId(
                  state.categories[index].lowercaseName);
              setState(() {
                currentIndex = index;
              });
            },
            child: Container(
              height: index == currentIndex ? 24.h : 40.h,
              margin:
                  EdgeInsetsDirectional.all(index == currentIndex ? 0.h : 3.h),
              padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                  color: index == currentIndex
                      ? AppColors.mainBlack
                      : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.mainBlack, width: .5)),
              child: Text(
                state.categories[index].name,
                style: AppTextStyles.font16BlackW400.copyWith(
                    color: index == currentIndex
                        ? Colors.white
                        : AppColors.mainBlack),
              ),
            ),
          ),
        );
      },
    );
  }
}
