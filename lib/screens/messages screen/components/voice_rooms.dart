import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/constants/app_styles.dart';

import '../../../constants/colors.dart';

class VoiceRooms extends StatelessWidget {
  const VoiceRooms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      color: ColorApp.mainApp,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27.0, vertical: 23.0),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  'Voice Rooms',
                  style: AppStyles.bigTitleBold,
                ),
                Spacer(),
                Text(
                  'More',
                  style: AppStyles.smallTitleBold,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  decoration:
                      const BoxDecoration(color: ColorApp.secondMainApp),
                ),
                Container(
                  decoration:
                      const BoxDecoration(color: ColorApp.secondMainApp),
                ),
                Container(
                  decoration:
                      const BoxDecoration(color: ColorApp.secondMainApp),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
