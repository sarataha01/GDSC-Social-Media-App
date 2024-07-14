import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Don\'t have an account?'),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/Signup');
          },
          style: TextButton.styleFrom(foregroundColor: Colors.transparent),
          child: const Text(
            'Register',
            style: TextStyle(
              color: ColorApp.registerText,
            ),
          ),
        )
      ],
    );
  }
}
