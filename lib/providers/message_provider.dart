import 'package:flutter/material.dart';

class MessageProvider extends ChangeNotifier {
  final List<String> messages = [];

  void addMessage(String message) {
    messages.add(message);
    notifyListeners();
  }

  String get lastMessage {
    if (messages.isNotEmpty) {
      return messages.last;
    } else {
      return '';
    }
  }
}
