
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_store/features/sign_up/data/models/user_model.dart';

class HelperFunctions{


Future<void> addUserToFirestore(
      {required UserModel user,required FirebaseFirestore firebaseFirestore}) async {
    final userRef = firebaseFirestore.collection('users').doc(user.token);
    await userRef.set({
      'token': user.token,
      'name': user.name,
      'image': user.imageUrl,
    });
  }


User? getCurrentUser() {
  final FirebaseAuth auth = FirebaseAuth.instance;
  return auth.currentUser;
}

}