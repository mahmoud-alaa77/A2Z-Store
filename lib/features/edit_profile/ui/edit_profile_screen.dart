import 'package:flutter/material.dart';
import 'package:online_store/core/helpers/spacing.dart';
import 'package:online_store/core/theming/app_colors.dart';
import 'package:online_store/features/edit_profile/ui/widgets/custom_app_bar.dart';
import 'package:online_store/features/edit_profile/ui/widgets/save_button.dart';
import 'package:online_store/features/edit_profile/ui/widgets/user_image.dart';
import 'package:online_store/features/edit_profile/ui/widgets/user_name_field.dart';
import 'package:toast/toast.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                            border: Border.all(),
                            borderRadius: BorderRadiusDirectional.circular(24),
                            color: AppColors.lighterGray),
                        width: MediaQuery.of(context).size.width - 80,
                        height: 300,
                        child: Column(
                          children: [
                            verticalSpace(85),
                            const UserNameField(),
                            const Spacer(),
                            const SaveButton(),
                            verticalSpace(16)
                          ],
                        ),
                      ),
                      const UserImage(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
