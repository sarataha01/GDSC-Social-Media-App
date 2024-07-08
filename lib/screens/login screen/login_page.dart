import 'package:flutter/material.dart';

import 'components/app_name.dart';
import 'components/divider.dart';
import 'components/login_form.dart';
import 'components/other_login_options.dart';
import 'components/register.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                AppName(),
                MyForm(),
                SizedBox(
                  height: 16,
                ),
                MyDivider(),
                SizedBox(
                  height: 16,
                ),
                LoginOptions(),
                Register(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
