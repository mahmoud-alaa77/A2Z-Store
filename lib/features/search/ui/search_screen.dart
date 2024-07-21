
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/helpers/extensions.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_colors.dart';
import 'package:online_store/features/home/ui/widgets/search/custom_filter_button.dart';
import 'package:online_store/features/search/logic/cubit/search_cubit.dart';
import 'package:online_store/features/search/ui/widgets/applay_and_cancel_buttons.dart';
import 'package:online_store/features/search/ui/widgets/custom_search_widget.dart';
import 'package:online_store/features/search/ui/widgets/search_bloc_builder.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  double startValue = 0.0;
  double endValue = 2000.0;
  bool showFilterList = false;
  late String val;
  @override
  Widget build(BuildContext context) {
    var searchCubit = context.read<SearchCubit>();
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
                    setState(() {
                      val = value;
                    });
                    searchCubit.isFiltered
                        ? searchCubit.searchAndFilterByPriceRange(
                            value, startValue, endValue)
                        : searchCubit.searchByValue(value);
                  },
                )),
                horizontalSpace(8),
                CustomFilterButton(
                  onTap: () {
                    setState(() {
                      showFilterList = !showFilterList;
                    });
                  },
                ),
              ],
            ),
            verticalSpace(16),
            showFilterList
                ? setFilterSearchSection(context)
                : const SizedBox.shrink(),
            verticalSpace(24),
            const SearchBlocBuilder(),
          ],
        ),
      )),
    );
  }

  Column setFilterSearchSection(BuildContext context) {
    var searchCubit = context.read<SearchCubit>();

    return Column(
      children: [
        Row(
          children: [
            const Text("Select price:"),
            horizontalSpace(4),
            Expanded(
              child: RangeSlider(
                values: RangeValues(startValue, endValue),
                activeColor: AppColors.mainBlack,
                onChanged: (value) {
                  setState(() {
                    startValue = value.start;
                    endValue = value.end;
                  });
                },
                labels: RangeLabels(startValue.toString(), endValue.toString()),
                divisions: 100,
                min: 0.0,
                max: 2000.0,
              ),
            ),
          ],
        ),
        ApplayAndCancelButtons(
          onPressedApplay: () {
            searchCubit.productsList.clear();
            searchCubit.searchAndFilterByPriceRange(val, startValue, endValue);
            searchCubit.isFiltered = true;
          },
          onPressedCancel: () {
            searchCubit.productsList.clear();
            searchCubit.searchByValue(val);

            searchCubit.isFiltered = false;
          },
        ),
      ],
    );
  }
}
