class MessageModel {
  final String senderId;
  final String receiverId;
  final String message;
  final DateTime timestamp;

  MessageModel({
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> data, String documentId) {
    return MessageModel(
      senderId: data['senderId'] ?? '',
      receiverId: data['receiverId'] ?? '',
      message: data['message'] ?? '',
      timestamp:
          DateTime.parse(data['timestamp'] ?? DateTime.now().toIso8601String()),
    );
  }
}
