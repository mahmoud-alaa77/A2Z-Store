import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/theming/app_colors.dart';
import 'package:online_store/features/edit_profile/logic/profile_info_cubit/profile_info_cubit.dart';

class UserNameField extends StatelessWidget {
  const UserNameField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            controller: context.read<ProfileInfoCubit>().newNameController,
            decoration: InputDecoration(
                hintText: context.read<ProfileInfoCubit>().userName,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(
                      color: AppColors.mainBlack,
                    ))),
          ),
        );
      },
    );
  }
}
