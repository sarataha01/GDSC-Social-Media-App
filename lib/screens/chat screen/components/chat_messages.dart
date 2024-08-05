import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/message_model.dart';
import '../../../providers/message_provider.dart';
import '../../../services/message_services.dart';
import 'chat_bubble.dart';

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
          if (messages.isNotEmpty) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              final latestMessage = messages.first.message;
              context.read<MessageProvider>().addMessage(chatId, latestMessage);
            });
          }
          if (messages.isEmpty) {
            return const Center(
              child: Text('No messages yet. Start the conversation!'),
            );
          }
          return ListView.builder(
            reverse: true,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              final isCurrentUser = message.senderId == currentUser!.uid;
              return ChatBubble(isCurrentUser: isCurrentUser, message: message);
            },
          );
        },
      ),
    );
  }
}
