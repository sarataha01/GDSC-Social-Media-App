import 'package:firebase_database/firebase_database.dart';

import '../models/message_model.dart';

class MessageServices {
  static final DatabaseReference _database = FirebaseDatabase.instance.ref();

  static Stream<List<MessageModel>> getMessages(String chatId) {
    return _database.child('chats/$chatId/messages').onValue.map((event) {
      if (event.snapshot.value == null) {
        return [];
      }

      final data = event.snapshot.value as Map<dynamic, dynamic>;
      final List<MessageModel> messages = data.entries.map((entry) {
        final messageData = Map<String, dynamic>.from(entry.value);
        return MessageModel.fromMap(messageData, entry.key);
      }).toList();

      return messages;
    });
  }

  static Future<void> sendMessage(String chatId, MessageModel message) async {
    await _database
        .child('chats/$chatId/messages')
        .push()
        .set(message.toJson());
  }
}
