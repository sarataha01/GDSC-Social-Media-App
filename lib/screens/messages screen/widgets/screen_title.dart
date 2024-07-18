import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class ScreenTitle extends StatelessWidget {
  final Text title;
  final Text subtitle;
  final Text? extraline;
  final Widget svgPicture;
  const ScreenTitle({
    super.key,
    required this.title,
    required this.subtitle,
    this.extraline,
    required this.svgPicture,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: ColorApp.buttonColor,
          radius: 31,
          child: svgPicture,
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title,
            subtitle,
            if (extraline != null) extraline!,
          ],
        )
      ],
    );
  }
}
