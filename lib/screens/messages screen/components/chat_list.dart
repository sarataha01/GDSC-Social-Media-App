import 'package:flutter/material.dart';

import '../../../models/user_model.dart';
import '../../../services/user_services.dart';
import 'chat_info.dart';

class ChatList extends StatelessWidget {
  const ChatList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              return Padding(
                padding: const EdgeInsets.only(left: 21.0, right: 31.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/Chat',
                      arguments: friendUser,
                    );
                  },
                  child: ChatInfo(friendUser: friendUser),
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
