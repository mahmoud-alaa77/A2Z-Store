import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/features/edit_profile/data/repos/profile_repo.dart';
part 'profile_image_state.dart';

class ProfileImageCubit extends Cubit<ProfileImageState> {
  final ProfileRepo _profileRepo;

  ProfileImageCubit(this._profileRepo) : super(ProfileImageInitial());

  String imageStringUrl = '';
  File? image;

  pickImage() async {
    var result = await _profileRepo.pickImage();

    result.fold((failure) {
      emit(UploadProfileImageFailure(failure.errorMessage));
    }, (imageFile) {
      image = imageFile;
      emit(PickImageSuccess(imageFile));
    });
  }

  loadProfileImage() async {
    var result = await _profileRepo.displayProfileInfo();

    result.fold((failure) {
      emit(UploadProfileImageFailure(failure.errorMessage));
    }, (user) {
      emit(UploadProfileImageSuccess(user.imageUrl));
      imageStringUrl = user.imageUrl;
    });
  }

  updateUserImage() async {
    emit(UploadProfileImageLoading());
    final response = await _profileRepo.updateUserImage(image!);
    response.fold(
      (failure) => emit(UploadProfileImageFailure(failure.errorMessage)),
      (imageUrl) {
        imageStringUrl = imageUrl;
        emit(UploadProfileImageSuccess(imageUrl));
      },
    );
  }
}
