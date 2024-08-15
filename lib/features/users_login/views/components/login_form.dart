import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/features/users_login/view_models/users_login_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_input_field.dart';

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
    return Consumer<UsersLoginViewModel>(
      builder: (context, viewModel, _) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 48),
              InputField(
                  controller: usernameCTRL,
                  prefix: const Icon(Icons.person_rounded),
                  hintText: 'Username',
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
                    Validators.checkLengthValidator(input, 7),
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: viewModel.isLoading ? 'Logging In...' : 'Login',
                icon: Icons.exit_to_app,
                color: ColorApp.buttonColor,
                textColor: ColorApp.secondaryText,
                onPressed: () {
                  if (!viewModel.isLoading) {
                    viewModel.logIn(context, _formKey, usernameCTRL, passCTRL);
                    if (viewModel.failure == null) {
                      Future.delayed(const Duration(seconds: 1), () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Log in successful')));
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
