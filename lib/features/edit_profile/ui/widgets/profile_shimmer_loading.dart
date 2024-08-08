// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:online_store/core/helpers/spacing.dart';
// import 'package:online_store/core/theming/app_colors.dart';

// import 'package:shimmer/shimmer.dart';

// class ProfileShimmerLoading extends StatelessWidget {
//   const ProfileShimmerLoading({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//         baseColor: AppColors.lighterGray,
//         highlightColor: Colors.white,
//         child: Center(
//           child: SizedBox(
//             height: 450,
//             child: Stack(
//               alignment: AlignmentDirectional.bottomCenter,
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                       border: Border.all(),
//                       borderRadius: BorderRadiusDirectional.circular(24),
//                       color: AppColors.lighterGray),
//                   width: MediaQuery.of(context).size.width - 80,
//                   height: 300,
//                   child: Column(
//                     children: [
//                       verticalSpace(85),
//                       Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: Container(
//                           width: 25.w,
//                           height: 80.h,
//                           decoration: BoxDecoration(
//                               borderRadius:
//                                   BorderRadiusDirectional.circular(16),
//                               color: AppColors.lightGray),
//                         ),
//                       ),
//                       const Spacer(),
//                       Container(
//                           width: 100.w,
//                           height: 50.h,
//                           decoration: BoxDecoration(
//                               borderRadius:
//                                   BorderRadiusDirectional.circular(16),
//                               color: const Color.fromARGB(255, 49, 49, 49)),
//                         ),
//                       verticalSpace(16)
//                     ],
//                   ),
//                 ),
//                 Positioned(
//       top: 65,
//       child: Stack(children: [
//         CircleAvatar(
//           backgroundColor: AppColors.mainBlack,
//           radius: 82.r,
//           child: CircleAvatar(
//                 radius: 80.r,
//                 backgroundColor: AppColors.mainBlack,
//                 child: Container(
//                   width: 160.w,
//                   height: 160.h,
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                   ),
                 
//                 ),
//           )  
//           )])
//             ),
//               ]
//             )))
//         );
//   }
// }
