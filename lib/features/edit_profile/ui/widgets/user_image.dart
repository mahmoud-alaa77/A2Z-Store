import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/helpers/constants.dart';
import 'package:online_store/core/theming/app_colors.dart';
import 'package:online_store/features/edit_profile/logic/profile_image_cubit/profile_image_cubit.dart';
import 'package:shimmer/shimmer.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      child: Stack(children: [
        CircleAvatar(
          backgroundColor: AppColors.mainBlack,
          radius: 82.r,
          child: CircleAvatar(
            radius: 80.r,
            backgroundColor: AppColors.mainBlack,
            child: Container(
              width: 160.w,
              height: 160.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(100),
                child: BlocBuilder<ProfileImageCubit, ProfileImageState>(
                  builder: (context, state) {
                    if (state is UploadProfileImageSuccess) {
                      return CachedNetworkImage(
                        imageUrl: state.imageUrl,
                        fit: BoxFit.cover,
                      );
                    } else if (state is PickImageSuccess) {
                      return Image.file(
                        state.image!,
                        fit: BoxFit.cover,
                      );
                    } else if (state is UploadProfileImageFailure) {
                      return const Center(child: Text("!!!"));
                    } else if (state is UploadProfileImageLoading) {
                      return Shimmer.fromColors(
                        baseColor: AppColors.lighterGray,
                        highlightColor: Colors.white,
                        child: CircleAvatar(
                          radius: 82.r,
                          backgroundColor: AppColors.lighterGray,
                        ),
                      );
                    } else {
                      return CachedNetworkImage(
                        imageUrl: context
                                .read<ProfileImageCubit>()
                                .imageStringUrl
                                .isNotEmpty
                            ? context.read<ProfileImageCubit>().imageStringUrl
                            : MyAppImages.defaultUserImage,
                        fit: BoxFit.cover,
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 5.h,
            right: 5.w,
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white70),
              child: IconButton(
                  onPressed: () async {
                    await context.read<ProfileImageCubit>().pickImage();
                  },
                  icon: const Icon(
                    Icons.edit,
                  )),
            )),
      ]),
    );
  }
}
