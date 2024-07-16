import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_text_styles.dart';
import 'package:online_store/features/home/ui/widgets/categories/categories_list_view.dart';
import 'package:online_store/features/home/ui/widgets/drawer/drawer_menu.dart';
import 'package:online_store/features/home/ui/widgets/home_app_bar.dart';
import 'package:online_store/features/home/ui/widgets/search_button.dart';
import 'package:online_store/features/home/ui/widgets/products/products_list_view.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double? screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _menuScaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation =
        Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
            .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Stack(
      children: <Widget>[
        DrawerMenu(
          position: _slideAnimation,
          scale: _menuScaleAnimation,
        ),
        homeBody(context),
      ],
    );
  }

  Widget homeBody(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 180.w,
      right: isCollapsed ? 0 : -180.w,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          elevation:isCollapsed ? 0 : 12,
          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
            child: CustomScrollView(
              scrollDirection: Axis.vertical,
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeAppBar(
                        onTap: () {
                          setState(() {
                            if (isCollapsed) {
                              _controller.forward();
                            } else {
                              _controller.reverse();
                            }

                            isCollapsed = !isCollapsed;
                          });
                        },
                      ),
                      verticalSpace(16),
                      const Text(
                        "Hi, Mahmoud",
                        style: AppTextStyles.font24BlackW900,
                      ),
                      const Text(
                        "To our Store",
                        style: AppTextStyles.font18DarkGrayW700,
                      ),
                      verticalSpace(16),
                      const SearchButton(),
                      verticalSpace(12),
                      const Text(
                        "Categories",
                        style: AppTextStyles.font24BlackW900,
                      ),
                      verticalSpace(12),
                      const CategoriesListView(),
                      verticalSpace(24),
                    ],
                  ),
                ),
                const SliverToBoxAdapter(
                  child: ProductsListView(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
