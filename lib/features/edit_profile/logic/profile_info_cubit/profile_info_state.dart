part of 'profile_info_cubit.dart';

sealed class ProfileInfoState {}

final class ProfileInitial extends ProfileInfoState {}

final class ProfileLoading extends ProfileInfoState {}

final class ProfileLoaded extends ProfileInfoState {
  final UserModel userModel;

  ProfileLoaded({required this.userModel});
}

final class ProfileUpdateSuccessfully extends ProfileInfoState {}

final class ProfileError extends ProfileInfoState {
  final String errorMessage;

  ProfileError(this.errorMessage);
}


