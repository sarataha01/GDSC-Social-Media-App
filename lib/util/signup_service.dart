import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/models/user_model.dart';
import 'package:gdsc_social_media_app/services/user_services.dart';

class SignupService {
  static void signup(
    BuildContext context,
    GlobalKey<FormState> formKey,
    TextEditingController nameCTRL,
    TextEditingController usernameCTRL,
    TextEditingController passCTRL,
    TextEditingController phoneCTRL,
    TextEditingController emailCTRL,
  ) {
    String name = nameCTRL.text;
    String email = emailCTRL.text;
    String password = passCTRL.text;
    String username = usernameCTRL.text;
    String phone = phoneCTRL.text;

    if (formKey.currentState!.validate()) {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      )
          .then((userCreds) {
        UserModel userModel = UserModel(
          name: name,
          username: username,
          email: email,
          phone: phone,
        );

        final userUid = userCreds.user!.uid;
        debugPrint('User UID: $userUid');

        UserServices.addUserData(context, userUid, userModel);
      }).catchError((error) {
        debugPrint('Firebase Auth Error: ${error.toString()}');
      });
    }
  }
}
