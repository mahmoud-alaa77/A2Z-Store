import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/widgets/custom_text_button.dart';
import 'package:online_store/features/edit_profile/logic/profile_image_cubit/profile_image_cubit.dart';
import 'package:online_store/features/edit_profile/logic/profile_info_cubit/profile_info_cubit.dart';
import 'package:toast/toast.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      title: "Save",
      width: 100,
      height: 50,
      onTap: () async {
        var name = context.read<ProfileInfoCubit>().newNameController.text;
        var image = context.read<ProfileImageCubit>().image;

        if (name.isNotEmpty && image != null) {
          await context.read<ProfileInfoCubit>().updateUsername();
          // ignore: use_build_context_synchronously
          await context.read<ProfileImageCubit>().updateUserImage();
          Toast.show("Update name and image successfully✅",
              duration: Toast.lengthLong, gravity: Toast.bottom);
        } else if (name.isNotEmpty && image == null) {
          await context.read<ProfileInfoCubit>().updateUsername();
          Toast.show("Update name successfully✅",
              duration: Toast.lengthLong, gravity: Toast.bottom);
        } else if (name.isEmpty && image != null) {
          await context.read<ProfileImageCubit>().updateUserImage();
          Toast.show("Update image successfully✅",
              duration: Toast.lengthLong, gravity: Toast.bottom);
        } else {
          Toast.show("Please fill in the required fields",
              duration: Toast.lengthLong, gravity: Toast.bottom);
        }
      },
    );
  }
}
