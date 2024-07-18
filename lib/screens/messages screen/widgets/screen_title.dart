import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/asset_data.dart';
import '../../../constants/colors.dart';

class ScreenTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  const ScreenTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: ColorApp.buttonColor,
          radius: 31,
          child: SvgPicture.asset(AssetData.messagePath),
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 12,
              ),
            )
          ],
        )
      ],
    );
  }
}
