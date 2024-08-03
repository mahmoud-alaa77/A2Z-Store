import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:online_store/features/edit_profile/data/repos/profile_repo.dart';
import 'package:online_store/features/sign_up/data/models/user_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  String userName = '';
  TextEditingController newNameController = TextEditingController();

  ProfileCubit(this._profileRepo) : super(ProfileInitial());

  loadProfileData() async {
    emit(ProfileLoading());

    var result = await _profileRepo.displayProfileInfo();

    result.fold((failure) {
      emit(ProfileError(failure.errorMessage));
    }, (user) {
      emit(ProfileLoaded(userModel: user));
      userName = user.name;
    });
  }

  updateUsername() async {
    await _profileRepo.updateUserName( newNameController.text);
    emit(ProfileUpdateSuccessfully());
var result = await _profileRepo.displayProfileInfo();

    result.fold((failure) {
      emit(ProfileError(failure.errorMessage));
    }, (user) {
      emit(ProfileLoaded(userModel: user));
      userName = user.name;
    });
  }
}
