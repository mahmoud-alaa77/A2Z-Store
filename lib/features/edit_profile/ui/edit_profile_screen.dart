import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_colors.dart';
import 'package:online_store/core/widgets/custom_text_button.dart';
import 'package:online_store/features/edit_profile/ui/widgets/custom_app_bar.dart';
import 'package:online_store/features/edit_profile/logic/profile_cubit/profile_cubit.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppBar(),
            Center(
              child: SizedBox(
                height: 450,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(24),
                          color: AppColors.lighterGray),
                      width: MediaQuery.of(context).size.width - 80,
                      height: 300,
                      child: Column(
                        children: [
                          verticalSpace(85),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: BlocBuilder<ProfileCubit, ProfileState>(
                              builder: (context, state) {
                                return TextField(
                                  controller: context
                                      .read<ProfileCubit>()
                                      .newNameController,
                                  decoration: InputDecoration(
                                      hintText:
                                          context.read<ProfileCubit>().userName,
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16)),
                                          borderSide: BorderSide(
                                            color: AppColors.mainBlack,
                                          ))),
                                );
                              },
                            ),
                          ),
                          const Spacer(),
                          CustomTextButton(
                            title: "Save",
                            width: 100,
                            height: 50,
                            onTap: () async {
                              if (context
                                  .read<ProfileCubit>()
                                  .newNameController
                                  .text
                                  .isNotEmpty) {
                                await context
                                    .read<ProfileCubit>()
                                    .updateUsername();
                                    // ignore: use_build_context_synchronously
                                    
                              }
                            },
                          ),
                          verticalSpace(16)
                        ],
                      ),
                    ),
                    Positioned(
                      top: 65,
                      child: CircleAvatar(
                        backgroundColor: AppColors.mainBlack,
                        radius: 82.r,
                        child: CircleAvatar(
                          radius: 80.r,
                          backgroundImage: const NetworkImage(
                              'https://images.pexels.com/photos/17945214/pexels-photo-17945214/free-photo-of-young-man-reading-a-newspaper-on-the-balcony.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                          child: Align(
                            alignment: AlignmentDirectional.bottomEnd,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.mainBlack.withOpacity(.5)),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
