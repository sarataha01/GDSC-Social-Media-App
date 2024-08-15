import 'package:flutter/cupertino.dart';

import '../../../core/constants/colors.dart';
import '../../../models/message_model.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.isCurrentUser,
    required this.message,
  });

  final bool isCurrentUser;
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: isCurrentUser ? ColorApp.buttonColor : ColorApp.mainApp,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            message.message,
            style: const TextStyle(
              color: ColorApp.secondaryText,
            ),
          ),
        ));
  }
}
