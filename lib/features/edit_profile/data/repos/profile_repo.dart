import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:online_store/core/errors/cloud_firestore_failure.dart';
import 'package:online_store/core/errors/failure.dart';
import 'package:online_store/core/errors/firebase_storage_failure.dart';
import 'package:online_store/core/helpers/constants.dart';
import 'package:online_store/core/helpers/shared_pref_helper.dart';
import 'package:online_store/features/sign_up/data/models/user_model.dart';

class ProfileRepo {
  final FirebaseFirestore firebaseFirestoreInstance;
  final FirebaseStorage firebaseStorage;
  ProfileRepo(this.firebaseFirestoreInstance, this.firebaseStorage);

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

  Future<Either<Failure, File?>> pickImage() async {
    File? image;
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        image = File(pickedFile.path);
        return right(image);
      }
      return left(Failure("Image picking failed"));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }







  Future<Either<Failure, String>> updateUserImage(File imageFile) async {
    try {
        String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final refStorage = FirebaseStorage.instance.ref().child('images/$fileName');
      UploadTask uploadTask = refStorage.putFile(imageFile);
  TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
  String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      final userRef = firebaseFirestoreInstance.collection('users').doc(
          await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken));
      await userRef.update({
        'image': downloadUrl,
      });
      return  Right(downloadUrl);
    } catch (error) {
if (error is FirebaseException) {
        return Left(FirebaseStorageFailure.fromFirebaseCoreException(error));
      } else {
        return Left(FirebaseStorageFailure(error.toString()));
      }    }
  }
}
