import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/services/user_services.dart';

class LoginService {
  static Future<void> login(
    BuildContext context,
    GlobalKey<FormState> formKey,
    TextEditingController usernameCTRL,
    TextEditingController passCTRL,
  ) async {
    String password = passCTRL.text;
    String username = usernameCTRL.text;

    if (formKey.currentState!.validate()) {
      String foundEmail = await UserServices.getEmail(username);
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: foundEmail, password: password)
          .then((onValue) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Log in successful')),
        );
        Navigator.pushNamed(context, '/Homepage');
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid username/password')),
        );
        debugPrint('Error: ${error.toString()}');
      });
    }
  }
}
