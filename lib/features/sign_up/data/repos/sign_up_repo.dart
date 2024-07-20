// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_store/core/errors/cloud_firestore_failure.dart';
import 'package:online_store/core/errors/fire_base_errors.dart';
import 'package:online_store/core/helpers/constants.dart';
import 'package:online_store/features/sign_up/data/models/signup_request_model.dart';
import 'package:online_store/features/sign_up/data/models/user_model.dart';

import '../../../../core/errors/failure.dart';

class SignUpRepo {
  final FirebaseAuth firebaseAuthInstance;

  SignUpRepo(this.firebaseAuthInstance);

  Future<Either<Failure, UserModel>> signUp(
      SignUpRequestModel requestModel) async {
    try {
      final response =
          await firebaseAuthInstance.createUserWithEmailAndPassword(
        email: requestModel.email,
        password: requestModel.password,
      );
      UserModel newUser = UserModel(
       name: requestModel.name,
       imageUrl: MyAppImages.defaultUserImage,
        token: response.user!.uid ?? "",
      );


    final userToken = response.user!.uid;
     final userRef = FirebaseFirestore.instance.collection('users').doc(userToken);
    await userRef.set({
      'token': userToken,
      'name': requestModel.name,
      'image': MyAppImages.defaultUserImage,
      // Add other fields as needed
    });


      return Right(newUser);
    } catch (error) {
      if (error is FirebaseAuthException) {
        return Left(FirebaseAuthFailure.fromFirebaseAuthException(error));
      }else if (error is FirebaseException) {
        return Left(CloudFirestoreFailure.fromFirebaseCoreException(error));
      } else {
        return Left(FirebaseAuthFailure(error.toString()));
      }
    }
  }
}
