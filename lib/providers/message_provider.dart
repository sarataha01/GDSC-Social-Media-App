import 'package:flutter/material.dart';

class MessageProvider extends ChangeNotifier {
  final Map<String, List<String>> _messages = {};

  void addMessage(String chatId, String message) {
    if (_messages.containsKey(chatId)) {
      _messages[chatId]!.add(message);
    } else {
      _messages[chatId] = [message];
    }
    notifyListeners();
  }

  String lastMessage(String chatId) {
    if (_messages.containsKey(chatId) && _messages[chatId]!.isNotEmpty) {
      return _messages[chatId]!.last;
    } else {
      return '';
    }
  }
}
