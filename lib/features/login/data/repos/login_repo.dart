import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:online_store/core/errors/cloud_firestore_failure.dart';
import 'package:online_store/core/errors/failure.dart';
import 'package:online_store/core/helpers/constants.dart';
import 'package:online_store/features/login/data/models/login_request_model.dart';
import 'package:online_store/features/sign_up/data/models/user_model.dart';

import '../../../../core/errors/fire_base_errors.dart';

class LoginRepo {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore firebaseFirestoreInstance;
  LoginRepo(this._firebaseAuth, this.firebaseFirestoreInstance);

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
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final userToken = googleAuth?.idToken;
      final user = firebaseFirestoreInstance.collection('users').doc(userToken);

      await user.set({
        'token': user.id,
        'name': googleUser.displayName ?? '',
        'image': googleUser.photoUrl ?? MyAppImages.defaultUserImage,
      });

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
