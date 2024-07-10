import 'package:flutter/material.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_text_styles.dart';
import 'package:online_store/features/home/ui/widgets/categories_list_view.dart';
import 'package:online_store/features/home/ui/widgets/custom_filter_button.dart';
import 'package:online_store/features/home/ui/widgets/custom_search_widget.dart';
import 'package:online_store/features/home/ui/widgets/products_list_view.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 8),
      child: CustomScrollView(
scrollDirection: Axis.vertical,
slivers: [
  SliverToBoxAdapter(
    child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hi, Mahmoud",
              style: AppTextStyles.font24BlackW900,
            ),
            const Text(
              "To our Store",
              style: AppTextStyles.font18DarkGrayW700,
            ),
            verticalSpace(16),
            const Row(
              children: [CustomSearchWidget(), Spacer(), CustomFilterButton()],
            ),
            verticalSpace(12),
            const Text(
              "Categories",
              style: AppTextStyles.font24BlackW900,
            ),
            verticalSpace(12),
            const CategoriesListView(),
            verticalSpace(24),
           
          ],
        ) ,
        
  ),
  const SliverToBoxAdapter(
    child:  ProductsListView(),
  )
],

      ),
    );
  }
}




/*
    CarouselSlider.builder(
              itemCount: 4,
              itemBuilder: (context, index, realIndex) {
                return ClipRRect(
                 borderRadius: BorderRadiusDirectional.circular(16), 
                  child: Image.network(
                    "https://i.imgur.com/OKn1KFI.jpeg",
                    height: 200.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                );
              },
              options: CarouselOptions(
                height: 200.h,
                viewportFraction: 0.9,
                initialPage: 0,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
              ),
            ),

Text("Hi, Mahmoud",style: AppTextStyles.font24BlackW900,),
                  verticalSpace(1),
                  Text("To A2Z Store",style: AppTextStyles.font18DarkGrayW700,)


                  Image.network(
                      
                      "https://i.imgur.com/OKn1KFI.jpeg",
                      height: 200.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),


                    Stack(
                  children:[
                   Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(16),
                      gradient:  LinearGradient(colors: [
                        
                        AppColors.lightGray,
                      Colors.white.withOpacity(.9)
                      ])
                    ),
                   ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text("50% Off",style: AppTextStyles.font30BlackW900.copyWith(color: Colors.white),),
                        
                         verticalSpace(8),
                         const Text("Code: Fgn1125",style: AppTextStyles.font16WhiteW700,),
  ],
),
Expanded(
  child: CircleAvatar(
    backgroundImage: NetworkImage("https://i.imgur.com/1ttYWaI.jpeg"),
    radius: 45.r,
  ),
)
                          ],
                        ),
                          
                                                  verticalSpace(28),

                    CustomTextButton(title: "Get Now",height: 35.h,width: 120.w,style: AppTextStyles.font16WhiteW700,)
                    
                      ],
                    ),
                  )
                  ] 
                );
*/