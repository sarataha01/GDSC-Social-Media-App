import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/constants/app_styles.dart';

import '../../../models/user_model.dart';
import '../../../util/get_avatar.dart';

class ChatInfo extends StatelessWidget {
  final UserModel friendUser;
  const ChatInfo({super.key, required this.friendUser});

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
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                friendUser.name,
                style: AppStyles.smallTitle,
              ),
              const Text(
                'el message hena',
                style: AppStyles.subTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        )
      ],
    );
  }
}
