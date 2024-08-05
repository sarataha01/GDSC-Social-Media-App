import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/constants/app_styles.dart';
import 'package:provider/provider.dart';

import '../../../models/user_model.dart';
import '../../../providers/message_provider.dart';
import '../../../util/get_avatar.dart';

class ChatInfo extends StatelessWidget {
  final UserModel friendUser;
  final String chatId;
  const ChatInfo({super.key, required this.friendUser, required this.chatId});

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
              Row(
                children: [
                  Text(
                    friendUser.name,
                    style: AppStyles.smallTitle,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '@${friendUser.username}',
                    style: AppStyles.subTitle2,
                  ),
                ],
              ),
              Text(
                context.watch<MessageProvider>().lastMessage(chatId),
                style: AppStyles.subTitle2,
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
