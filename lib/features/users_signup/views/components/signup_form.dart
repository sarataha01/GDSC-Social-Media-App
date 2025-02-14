import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/features/users_signup/view_models/users_signup_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_input_field.dart';

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
    return Consumer<UsersSignupViewModel>(
      builder: (context, viewModel, _) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 48),
              InputField(
                  controller: nameCTRL,
                  prefix: const Icon(Icons.account_circle_rounded),
                  hintText: 'Display Name',
                  validator: (String? input) =>
                      Validators.checkLengthValidator(input, 7)),
              const SizedBox(height: 16),
              InputField(
                  controller: usernameCTRL,
                  prefix: const Icon(Icons.person_2_rounded),
                  hintText: 'Username',
                  validator: (String? input) =>
                      Validators.checkLengthValidator(input, 7)),
              const SizedBox(height: 16),
              InputField(
                  controller: emailCTRL,
                  prefix: const Icon(Icons.email_rounded),
                  hintText: 'Email',
                  validator: (String? input) =>
                      Validators.checkLengthValidator(input, 7)),
              const SizedBox(height: 16),
              InputField(
                  controller: phoneCTRL,
                  prefix: const Icon(Icons.phone_rounded),
                  hintText: 'Phone Number',
                  validator: (String? input) =>
                      Validators.checkLengthValidator(input, 7)),
              const SizedBox(height: 16),
              InputField(
                  controller: passCTRL,
                  obscureText: obscure,
                  prefix: const Icon(Icons.lock_rounded),
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
                      Validators.checkLengthValidator(input, 7)),
              const SizedBox(height: 16),
              CustomButton(
                text: viewModel.isLoading ? 'Signing Up...' : 'Signup',
                icon: Icons.arrow_forward,
                color: ColorApp.buttonColor,
                textColor: ColorApp.secondaryText,
                onPressed: () {
                  if (!viewModel.isLoading) {
                    viewModel.signUp(context, _formKey, nameCTRL, usernameCTRL,
                        passCTRL, phoneCTRL, emailCTRL);

                    if (viewModel.failure == null) {
                      Future.delayed(const Duration(seconds: 1), () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Sign up successful')));
                      });
                    } else {
                      Future.delayed(const Duration(seconds: 1), () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(viewModel.failure.toString())),
                        );
                      });
                    }
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
