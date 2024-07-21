import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/helpers/constants.dart';
import 'package:online_store/core/helpers/shared_pref_helper.dart';
import 'package:online_store/features/home/data/repos/profile_repo.dart';
import 'package:online_store/features/sign_up/data/models/user_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  String userName = '';
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

  getUserIdFromPreferences() async {
    return SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  }
}
