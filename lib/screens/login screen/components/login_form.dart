import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../util/login_service.dart';
import '../../../util/validators.dart';
import '../../shared widgets/custom_button.dart';
import '../../shared widgets/custom_input_field.dart';

class MyLoginForm extends StatefulWidget {
  const MyLoginForm({super.key});

  @override
  State<MyLoginForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyLoginForm> {
  final TextEditingController passCTRL = TextEditingController();
  final TextEditingController usernameCTRL = TextEditingController();
  bool obscure = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        const SizedBox(
          height: 48,
        ),
        InputField(
          controller: usernameCTRL,
          prefix: const Icon(
            Icons.person_rounded,
          ),
          hintText: 'Username',
          validator: (String? input) =>
              Validators.checkLengthValidator(input, 7),
        ),
        const SizedBox(
          height: 16,
        ),
        InputField(
          controller: passCTRL,
          obscureText: obscure,
          prefix: const Icon(
            Icons.lock_rounded,
          ),
          suffix: IconButton(
            onPressed: () {
              setState(() {
                obscure = !obscure;
              });
            },
            icon: obscure
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
          ),
          hintText: 'Password',
          validator: (String? input) =>
              Validators.checkLengthValidator(input, 7),
        ),
        const SizedBox(
          height: 16,
        ),
        CustomButton(
          text: 'Login',
          icon: Icons.exit_to_app,
          color: ColorApp.buttonColor,
          textColor: ColorApp.secondaryText,
          onPressed: () {
            LoginService.login(context, _formKey, usernameCTRL, passCTRL);
          },
        ),
      ]),
    );
  }
}
