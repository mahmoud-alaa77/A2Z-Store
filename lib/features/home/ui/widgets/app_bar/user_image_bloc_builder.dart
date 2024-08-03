

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/theming/app_colors.dart';
import 'package:online_store/core/theming/app_text_styles.dart';
import 'package:online_store/features/edit_profile/logic/profile_cubit/profile_cubit.dart';
import 'package:shimmer/shimmer.dart';

class UserImageBlocBuilder extends StatelessWidget {
  const UserImageBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoaded) {
              return CircleAvatar(
                backgroundColor: AppColors.darkGray,
                radius: 26.r,
                child: CircleAvatar(
                  backgroundColor: AppColors.lighterGray,
                  backgroundImage: NetworkImage(state.userModel.imageUrl),
                  radius: 25.0,
                ),
              );
            } else if (state is ProfileError) {
              return const CircleAvatar(
                backgroundColor: AppColors.lighterGray,
                radius: 25.0,
                child: Text(
                  "!",
                  style: AppTextStyles.font18BlackW900,
                ),
              );
            } else {
              return Shimmer.fromColors(
                  baseColor: AppColors.lighterGray,
                  highlightColor: AppColors.lightGray,
                  child: const CircleAvatar(
                    backgroundColor: AppColors.lighterGray,
                    radius: 25.0,
                  ));
            }
          },
        );
  }
}