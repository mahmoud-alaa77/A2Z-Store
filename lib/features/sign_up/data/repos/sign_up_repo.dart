// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_store/core/errors/fire_base_errors.dart';
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
       imageUrl: "",
        token: response.user!.uid ?? "",
      );
      return Right(newUser);
    } catch (error) {
      if (error is FirebaseAuthException) {
        return Left(FirebaseAuthFailure.fromFirebaseAuthException(error));
      } else {
        return Left(FirebaseAuthFailure(error.toString()));
      }
    }
  }
}
