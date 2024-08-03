import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String postId;
  final String userUid;
  final String name;
  final String userName;
  final DateTime time;
  final String? text;
  final String? image;
  final int likes;
  final int comments;
  final int shares;
  final List<String> likedBy;

  PostModel({
    required this.postId,
    required this.userUid,
    required this.name,
    required this.userName,
    required this.time,
    this.text,
    this.image,
    required this.likes,
    required this.comments,
    required this.shares,
    this.likedBy = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'userUid': userUid,
      'name': name,
      'userName': userName,
      'time': Timestamp.fromDate(time),
      'text': text,
      'image': image,
      'likes': likes,
      'comments': comments,
      'shares': shares,
      'likedBy': likedBy,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> data) {
    return PostModel(
      postId: data['postId'] ?? '',
      userUid: data['userUid'] ?? '',
      name: data['name'] ?? '',
      userName: data['userName'] ?? '',
      time: (data['time'] as Timestamp).toDate(),
      text: data['text'] ?? '',
      image: data['image'] ?? '',
      likes: data['likes'] ?? 0,
      comments: data['comments'] ?? 0,
      shares: data['shares'] ?? 0,
      likedBy: List<String>.from(data['likedBy'] ?? []),
    );
  }
}
