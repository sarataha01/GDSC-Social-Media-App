import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
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
              style: TextStyle(fontSize: 16, color: ColorApp.secondaryText),
            ),
            Text(
              'ay kalam',
              style: TextStyle(fontSize: 10, color: ColorApp.textField),
            ),
            Text(
              'el message',
              style: TextStyle(fontSize: 10, color: ColorApp.textField),
            ),
          ],
        )
      ],
    );
  }
}
