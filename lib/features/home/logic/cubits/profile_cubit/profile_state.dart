part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final UserModel userModel;

  ProfileLoaded({required this.userModel});
}

final class ProfileError extends ProfileState {
  final String errorMessage;

  ProfileError(this.errorMessage);
}
