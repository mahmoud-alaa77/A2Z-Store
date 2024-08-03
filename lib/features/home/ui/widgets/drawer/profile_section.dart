import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/theming/app_text_styles.dart';
import 'package:online_store/features/edit_profile/logic/profile_cubit/profile_cubit.dart';

import '../../../../../core/theming/app_colors.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) => current is ProfileLoaded || current is ProfileInitial || current is ProfileLoading,
      builder: (context, state) {
        if (state is ProfileLoaded) {
          return Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsetsDirectional.all(8),
              decoration: BoxDecoration(
                 // border: Border.all(color: AppColors.darkGray),
                  borderRadius: BorderRadiusDirectional.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.lightGray,
                    radius: 37.r,
                    child: CircleAvatar(
                      radius: 35.r,
                      backgroundImage: NetworkImage(state.userModel.imageUrl),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    {state.userModel.name}.length > 15
                        ? {state.userModel.name}.toString().substring(0, 15)
                        : state.userModel.name,
                    style: AppTextStyles.font16BlackW400,
                  ),
                ],
              ),
            ),
          );
        } else if (state is ProfileError) {
          return Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(state.errorMessage,
                  style: AppTextStyles.font12BlackW400));
        }else if (state is ProfileLoading) {
          return const SizedBox.shrink();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}



