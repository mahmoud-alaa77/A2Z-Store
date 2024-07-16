import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:online_store/core/errors/failure.dart';
import 'package:online_store/features/login/data/models/login_request_model.dart';

import '../../../../core/errors/fire_base_errors.dart';

class LoginRepo {
  final FirebaseAuth _firebaseAuth;

  LoginRepo(this._firebaseAuth);

  Future<Either<Failure, UserCredential>> login(
      LoginRequestModel requestModel) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: requestModel.email, password: requestModel.password);

      return right(userCredential);
    } catch (error) {
      if (error is FirebaseAuthException) {
        return left(FirebaseAuthFailure.fromFirebaseAuthException(error));
      } else {
        return left(Failure(error.toString()));
      }
    }
  }

  Future<Either<Failure, UserCredential>?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return null;
      }
      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential wrapped in a right function
      return right(
          await FirebaseAuth.instance.signInWithCredential(credential));
    } catch (error) {
      if (error is FirebaseAuthException) {
        return left(FirebaseAuthFailure.fromFirebaseAuthException(error));
      } else {
        return left(Failure(error.toString()));
      }
    }
  }
}
