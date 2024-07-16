import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_store/core/helpers/constants.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_text_styles.dart';
import 'package:online_store/features/home/data/models/product_model.dart';
import 'package:online_store/features/search/logic/cubit/search_cubit.dart';
import 'package:online_store/features/search/ui/widgets/product_search_item.dart';
import 'package:online_store/features/search/ui/widgets/search_list_shimmer_loading.dart';

class SearchBlocBuilder extends StatelessWidget {
  const SearchBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchSuccessful) {
            List<Product> productsList = state.productsList;
            return productsList.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        MyAppImages.noDataSvgImage,
                        width: 200.w,
                        height: 200.h,
                      ),
                      verticalSpace(12),
                      const Text(
                        "No Products Founded",
                        style: AppTextStyles.font18BlackW900,
                      ),
                    ],
                  )
                : ListView.separated(
                    separatorBuilder: (context, index) => verticalSpace(16),
                    itemCount: productsList.length,
                    itemBuilder: (context, index) {
                      return ProductSearchItem(product: productsList[index]);
                    },
                  );
          } else if (state is SearchError) {
            return Center(child: Text(state.message));
          } else if (state is SearchInitial) {
            return Center(
                child: SvgPicture.asset(
              MyAppImages.searchSvgImage,
              width: 200.w,
              height: 200.h,
            ));
          } else {
            return const SearchListShimmerLoading();
          }
        },
      ),
    );
  }
}
