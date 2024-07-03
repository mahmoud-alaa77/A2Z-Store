import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/theming/app_colors.dart';
import 'package:online_store/core/theming/app_text_styles.dart';
import 'package:online_store/features/on_boarding/ui/widgets/on_boarding_page_body.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: OnBoardingSlider(
          skipIcon: const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
          finishButtonText: "Get Started",
          finishButtonStyle: const FinishButtonStyle(
              backgroundColor: AppColors.mainBlack,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)))),
          headerBackgroundColor: Colors.white,
          background: [
            Container(
              color: Colors.white,
            ),
            Container(
              color: Colors.white,
            ),
            Container(
              color: Colors.white,
            ),
          ],
          totalPage: 3,
          speed: 1.8,
          pageBodies: const [
            OnBoardingPageBody(
              title: "20% Discount\nNew Arrival Product ",
              desc:
                  "Publish up your selfies to make yourself\nmore beautiful with this app.",
              imageUrl: "assets/images/on_boarding_image_1.jpg",
            ),
            OnBoardingPageBody(
              title: "Take Advantage\nOf The Offer Shopping",
              desc:
                  "Publish up your selfies to make yourself\nmore beautiful with this app.",
              imageUrl: "assets/images/on_boarding_image_2.jpg",
            ),
            OnBoardingPageBody(
              title: "All Types Offers\nWithin Your Reach",
              desc:
                  "Publish up your selfies to make yourself\nmore beautiful with this app.",
              imageUrl: "assets/images/on_boarding_image_3.jpg",
            ),
          ],
          skipTextButton: Container(
            width: 80.w,
            //height: 70.h,
            decoration: BoxDecoration(
              color: AppColors.mainBlack,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
                child: Text(
              "Skip",
              style: AppTextStyles.font16WhiteW700,
            )),
          ),
        ),
      ),
    );
  }
}
