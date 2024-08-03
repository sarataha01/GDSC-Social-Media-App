import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/constants/colors.dart';

import '../../../models/message_model.dart';
import '../../../services/message_services.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({
    super.key,
    required MessageServices messageServices,
    required this.chatId,
    required this.currentUser,
  });

  final String chatId;
  final User? currentUser;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<List<MessageModel>>(
        stream: MessageServices.getMessages(chatId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            debugPrint('${snapshot.error}');
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final messages = snapshot.data!
            ..sort((a, b) => b.timestamp.compareTo(a.timestamp));

          return ListView.builder(
            reverse: true,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              final isCurrentUser = message.senderId == currentUser!.uid;
              return Align(
                alignment: isCurrentUser
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 8.0),
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color:
                        isCurrentUser ? ColorApp.buttonColor : ColorApp.mainApp,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    message.message,
                    style: const TextStyle(
                      color: ColorApp.secondaryText,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
