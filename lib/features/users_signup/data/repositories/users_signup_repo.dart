import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/features/users_signup/data/repositories/users_signup_repo_interface.dart';

import '../../../../core/api_tools/failure.dart';
import '../../../../core/entities/user_model.dart';

class UsersSignupRepo implements UsersSignupRepoInterface {
  @override
  Future<Either<Failure, void>> signUp(
    BuildContext context,
    GlobalKey<FormState> formKey,
    TextEditingController nameCTRL,
    TextEditingController usernameCTRL,
    TextEditingController passCTRL,
    TextEditingController phoneCTRL,
    TextEditingController emailCTRL,
  ) async {
    String name = nameCTRL.text;
    String email = emailCTRL.text;
    String password = passCTRL.text;
    String username = usernameCTRL.text;
    String phone = phoneCTRL.text;

    if (formKey.currentState!.validate()) {
      try {
        UserCredential userCreds =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.trim(),
          password: password,
        );

        UserModel userModel = UserModel(
          name: name,
          username: username,
          email: email,
          phone: phone,
        );

        final userUid = userCreds.user!.uid;
        debugPrint('User UID: $userUid');
        if (context.mounted) {
          await addUserData(context, userUid, userModel);
        }
        return const Right(null);
      } catch (error) {
        debugPrint('Firebase Auth Error: ${error.toString()}');
        return Left(Failure(error.toString()));
      }
    } else {
      return Left(Failure('Form validation failed'));
    }
  }

  @override
  Future<Either<Failure, void>> addUserData(
      BuildContext context, String? uid, UserModel user) async {
    if (uid == null) {
      debugPrint("User UID not available. Cannot add user data.");
      return Left(Failure("User UID not available."));
    }

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .set(user.toJson());

      debugPrint("Data inserted for UID: $uid");
      if (context.mounted) {
        Navigator.pushNamed(context, '/Homepage');
      }
      return const Right(null);
    } catch (error) {
      debugPrint('Firestore Error: ${error.toString()}');
      return Left(Failure(error.toString()));
    }
  }
}
