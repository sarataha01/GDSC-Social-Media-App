import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/constants/app_styles.dart';

import '../../../constants/colors.dart';

class RecentSection extends StatelessWidget {
  const RecentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27.0),
      child: Container(
        width: double.infinity,
        height: 40,
        color: ColorApp.mainApp,
        child: const Row(
          children: [
            Text(
              'Recent',
              style: AppStyles.small4TitleBold,
            ),
          ],
        ),
      ),
    );
  }
}
