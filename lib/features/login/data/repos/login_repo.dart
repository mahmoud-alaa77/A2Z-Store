import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:online_store/core/errors/failure.dart';
import 'package:online_store/core/helpers/constants.dart';
import 'package:online_store/core/helpers/functions.dart';
import 'package:online_store/core/helpers/shared_pref_helper.dart';
import 'package:online_store/features/login/data/models/login_request_model.dart';
import '../../../../core/errors/fire_base_errors.dart';
import '../../../sign_up/data/models/user_model.dart';

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

  Future<Either<Failure, UserModel>?> signInWithGoogle() async {
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

      final userTokenn = googleAuth?.accessToken;
      final user =
          firebaseFirestoreInstance.collection('users').doc(userTokenn);
      UserModel newUser = UserModel(
        name: googleUser.displayName ?? '',
        imageUrl: googleUser.photoUrl ?? MyAppImages.defaultUserImage,
        token: user.id,
      );
      //save user token in shared prefrance
      SharedPrefHelper.setSecuredString(
          SharedPrefKeys.userToken, userTokenn ?? "");

//save user information to firestore
      await HelperFunctions().addUserToFirestore(
          user: newUser, firebaseFirestore: firebaseFirestoreInstance);

      await _firebaseAuth.signInWithCredential(credential);
      return right(newUser);
    } catch (error) {
      if (error is FirebaseAuthException) {
        return left(FirebaseAuthFailure.fromFirebaseAuthException(error));
      } else {
        return left(Failure(error.toString()));
      }
    }
  }
}
