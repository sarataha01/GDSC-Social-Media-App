import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/util/get_chat_id.dart';

import '../../../models/user_model.dart';
import '../../../services/user_services.dart';
import 'chat_info.dart';

class ChatList extends StatelessWidget {
  const ChatList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    return Expanded(
      child: StreamBuilder<List<UserModel>>(
        stream: UserServices.fetchUserStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final users = snapshot.data ?? [];

          return ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: users.length,
            itemBuilder: (context, index) {
              final friendUser = users[index];
              final String chatId =
                  ChatId.getChatId(currentUser!.uid, friendUser.uid!);
              return Padding(
                padding: const EdgeInsets.only(left: 21.0, right: 31.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/Chat',
                      arguments: friendUser,
                    ); // Navigates to ChatPage()
                  },
                  child: ChatInfo(friendUser: friendUser, chatId: chatId),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 16);
            },
          );
        },
      ),
    );
  }
}
