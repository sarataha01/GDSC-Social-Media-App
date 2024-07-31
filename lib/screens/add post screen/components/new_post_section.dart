import 'package:flutter/material.dart';

import '../../../constants/app_styles.dart';

class NewPostSection extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const NewPostSection(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'New Post',
          style: AppStyles.bigTitleBold,
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: AppStyles.small3TitleBold,
          ),
        ),
      ],
    );
  }
}
