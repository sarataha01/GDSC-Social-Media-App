import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../services/signup_service.dart';
import '../../../util/validators.dart';
import '../../shared widgets/custom_button.dart';
import '../../shared widgets/custom_input_field.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _MyFormState();
}

class _MyFormState extends State<SignupForm> {
  final TextEditingController usernameCTRL = TextEditingController();
  final TextEditingController nameCTRL = TextEditingController();
  final TextEditingController emailCTRL = TextEditingController();
  final TextEditingController passCTRL = TextEditingController();
  final TextEditingController phoneCTRL = TextEditingController();
  bool obscure = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 48,
          ),
          InputField(
            controller: nameCTRL,
            prefix: const Icon(
              Icons.account_circle_rounded,
            ),
            hintText: 'Display Name',
            validator: (String? input) =>
                Validators.checkLengthValidator(input, 7),
          ),
          const SizedBox(
            height: 16,
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
            controller: emailCTRL,
            prefix: const Icon(
              Icons.email_rounded,
            ),
            hintText: 'Email',
            validator: (String? input) =>
                Validators.checkLengthValidator(input, 7),
          ),
          const SizedBox(
            height: 16,
          ),
          InputField(
            controller: phoneCTRL,
            prefix: const Icon(
              Icons.phone_rounded,
            ),
            hintText: 'Phone Number',
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
            text: 'Signup',
            icon: Icons.arrow_forward,
            color: ColorApp.buttonColor,
            textColor: ColorApp.secondaryText,
            onPressed: () {
              SignupService.signup(context, _formKey, nameCTRL, usernameCTRL,
                  passCTRL, phoneCTRL, emailCTRL);
            },
          ),
        ],
      ),
    );
  }
}
