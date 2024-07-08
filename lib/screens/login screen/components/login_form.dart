import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../util/login_service.dart';
import '../../../util/validators.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_input_field.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final TextEditingController usernameCTRL = TextEditingController();
  final TextEditingController passCTRL = TextEditingController();
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
            Icons.person_2_rounded,
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
