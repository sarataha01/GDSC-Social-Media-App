import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class InteractionCount extends StatelessWidget {
  final Icon icon;
  final String text;
  final VoidCallback onPressed;
  const InteractionCount(
      {super.key,
      required this.icon,
      required this.text,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: icon,
          padding: EdgeInsets.zero,
        ),
        Text(
          text,
          style: const TextStyle(color: ColorApp.textField),
        ),
      ],
    );
  }
}
