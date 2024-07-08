import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1.2,
            indent: 60,
            endIndent: 16,
            color: ColorApp.textField,
          ),
        ),
        Text('OR'),
        Expanded(
          child: Divider(
            thickness: 1.2,
            indent: 16,
            endIndent: 60,
            color: ColorApp.textField,
          ),
        ),
      ],
    );
  }
}
