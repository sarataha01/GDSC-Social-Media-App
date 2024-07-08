import 'package:flutter/material.dart';

class LoginService {
  static void login(BuildContext context, GlobalKey<FormState> formKey,
      TextEditingController usernameCTRL, TextEditingController passCTRL) {
    if (formKey.currentState!.validate() ?? false) {
      String username = usernameCTRL.text;
      String password = passCTRL.text;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login successful')),
      );

      Navigator.pushNamed(context, '/Homepage');
    }
  }
}
