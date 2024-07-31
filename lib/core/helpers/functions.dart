import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_store/features/sign_up/data/models/user_model.dart';

class HelperFunctions {
  Future<void> addUserToFirestore(
      {required UserModel user,
      required FirebaseFirestore firebaseFirestore}) async {
    final userRef = firebaseFirestore.collection('users').doc(user.token);
    await userRef.set({
      'token': user.token,
      'name': user.name,
      'image': user.imageUrl,
    });
  }
  

 double convertDoubleNumber(BuildContext context,double number) {
     double totalprice =number;
    String truncatedString =
        totalprice.toStringAsFixed(2);
    double truncatedNumber =
        double.parse(truncatedString);
    return truncatedNumber;
  }


}
