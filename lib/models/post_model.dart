import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String userUid;
  final String name;
  final String userName;
  final DateTime time;
  final String? text;
  final String? image;
  final int likes;
  final int comments;
  final int shares;

  PostModel({
    required this.userUid,
    required this.name,
    required this.userName,
    required this.time,
    this.text,
    this.image,
    required this.likes,
    required this.comments,
    required this.shares,
  });

  Map<String, dynamic> toJson() {
    return {
      'userUid': userUid,
      'name': name,
      'userName': userName,
      'time': Timestamp.fromDate(time),
      'text': text,
      'image': image,
      'likes': likes,
      'comments': comments,
      'shares': shares,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> data) {
    return PostModel(
      userUid: data['userUid'] ?? '',
      name: data['name'] ?? '',
      userName: data['userName'] ?? '',
      time: (data['time'] as Timestamp).toDate(),
      text: data['userName'] ?? '',
      image: data['image'] ?? '',
      likes: data['likes'] ?? 0,
      comments: data['comments'] ?? 0,
      shares: data['shares'] ?? 0,
    );
  }
}
