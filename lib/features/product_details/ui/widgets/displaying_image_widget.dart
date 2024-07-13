import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_colors.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class DisplayingImagesWidget extends StatefulWidget {
  final int lengthOfImagesList;
  final List<String>? images;

  const DisplayingImagesWidget(
      {super.key, required this.lengthOfImagesList, required this.images});

  @override
  State<DisplayingImagesWidget> createState() => _DisplayingImagesWidgetState();
}

int current = 0;

class _DisplayingImagesWidgetState extends State<DisplayingImagesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.lengthOfImagesList,
          itemBuilder: (context, index, realIndex) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(16),
                  color: AppColors.lighterGray),
              child: ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(16),
                child: CachedNetworkImage(
                  errorWidget: (context, url, error) {
                    return Container(
                      decoration: BoxDecoration(
                          color: AppColors.darkGray.withOpacity(.7)),
                      child: const Center(
                        child: Text("No Internet Connection"),
                      ),
                    );
                  },
                  imageUrl: widget.images![index].toString(),
                  height: MediaQuery.of(context).size.height / 3.2,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          options: CarouselOptions(
              aspectRatio: 10 / 7,
              viewportFraction: .9,
              initialPage: 0,
              scrollPhysics: widget.images!.length == 1
                  ? const NeverScrollableScrollPhysics()
                  : const AlwaysScrollableScrollPhysics(),
              enableInfiniteScroll: true,
              autoPlay: widget.images!.length == 1 ? false : true,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              onPageChanged: (index, reason) {
                setState(() {
                  current = index;
                });
              }),
        ),

        verticalSpace(10),
        //Custom Indicator
        PageViewDotIndicator(
          currentItem: current,
          count: widget.images!.length,
          unselectedColor: AppColors.lightGray,
          selectedColor: AppColors.mainBlack,
          unselectedSize: const Size(8, 8),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    current = 0;
  }
}
