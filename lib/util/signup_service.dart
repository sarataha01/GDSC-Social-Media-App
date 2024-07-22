import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/models/user_model.dart';
import 'package:gdsc_social_media_app/services/user_services.dart';

class SignupService {
  static void signup(
    BuildContext context,
    GlobalKey<FormState> formKey,
    TextEditingController usernameCTRL,
    TextEditingController passCTRL,
    TextEditingController phoneCTRL,
    TextEditingController emailCTRL,
  ) {
    String email = emailCTRL.text;
    String password = passCTRL.text;
    String username = usernameCTRL.text;
    String phone = phoneCTRL.text;

    if (formKey.currentState!.validate()) {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((userCreds) {
        UserModel userModel = UserModel(
          username: username,
          email: email,
          phone: phone,
        );

        final userUid = UserServices.getUserUID();
        debugPrint('$userUid');

        FirebaseFirestore.instance
            .collection('users')
            .add(userModel.toJson())
            .whenComplete(() {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Sign up successful')),
          );
          Navigator.pushNamed(context, '/Homepage');
        });
      }).catchError((error) {
        debugPrint('Error: ${error.toString()}');
      });
    }
  }
}
