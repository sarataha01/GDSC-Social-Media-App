import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final Widget? prefix;
  final Widget? suffix;
  final String hintText;
  final String? Function(String?) validator;

  const InputField({
    super.key,
    required this.controller,
    this.obscureText = false,
    this.prefix,
    this.suffix,
    required this.hintText,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: prefix,
        prefixIconColor: ColorApp.textField,
        suffixIcon: suffix,
        suffixIconColor: ColorApp.textField,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
        ),
        focusedBorder: _getBorder(),
        focusedErrorBorder: _getBorder(color: Colors.redAccent),
        enabledBorder: _getBorder(),
        errorBorder: _getBorder(color: Colors.redAccent),
      ),
      obscureText: obscureText,
    );
  }

  InputBorder _getBorder({Color color = ColorApp.textField}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: color,
      ),
      borderRadius: BorderRadius.circular(30),
    );
  }
}
