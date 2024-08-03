import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:online_store/core/errors/cloud_firestore_failure.dart';
import 'package:online_store/core/errors/failure.dart';
import 'package:online_store/core/helpers/constants.dart';
import 'package:online_store/core/helpers/shared_pref_helper.dart';
import 'package:online_store/features/sign_up/data/models/user_model.dart';

class ProfileRepo {
  final FirebaseFirestore firebaseFirestoreInstance;

  ProfileRepo(this.firebaseFirestoreInstance);

  Future<Either<Failure, UserModel>> displayProfileInfo() async {
    try {
      final user = firebaseFirestoreInstance.collection("users").doc(
          await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken));

      DocumentSnapshot snapshot = await user.get();
      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

        UserModel model = UserModel(
            name: data['name'], imageUrl: data['image'], token: data['token']);

        return right(model);
      } else {
        throw Failure('User not found');
      }
    } catch (error) {
      if (error is FirebaseException) {
        return left(CloudFirestoreFailure.fromFirebaseCoreException(error));
      } else {
        return left(Failure(error.toString()));
      }
    }
  }

  Future<Either<Failure, String>> updateUserName(String newName) async {
    try {
      final userRef = firebaseFirestoreInstance.collection('users').doc(
          await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken));
      await userRef.update({
        'name': newName,
      });
      return const Right("Update Success");
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }
}
