import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/constants/app_styles.dart';

class RecentSection extends StatelessWidget {
  const RecentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 27.0),
      child: SizedBox(
        height: 40,
        child: Row(
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
