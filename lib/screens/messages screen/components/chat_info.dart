import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/constants/app_styles.dart';

import '../../../util/get_avatar.dart';

class ChatInfo extends StatelessWidget {
  const ChatInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage(
            GeneralUtils.getUniqueAvatar(),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Annyeonghaseyo ',
              style: AppStyles.smallTitle,
            ),
            Text(
              'ay kalam',
              style: AppStyles.subTitle,
            ),
            Text(
              'el message',
              style: AppStyles.subTitle,
            ),
          ],
        )
      ],
    );
  }
}
