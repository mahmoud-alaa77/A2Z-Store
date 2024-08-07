part of 'profile_image_cubit.dart';

sealed class ProfileImageState {}

final class ProfileImageInitial extends ProfileImageState {}

class UploadProfileImageSuccess extends ProfileImageState {
  final String imageUrl;

  UploadProfileImageSuccess(this.imageUrl);
}

class UploadProfileImageFailure extends ProfileImageState {
  final String errorMessage;

  UploadProfileImageFailure(this.errorMessage);
}

class UploadProfileImageLoading extends ProfileImageState {}

class PickImageSuccess extends ProfileImageState {
  final File? image;
  PickImageSuccess(this.image);
}


