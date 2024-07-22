import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? uid;
  final String username;
  final String email;
  final String phone;

  UserModel({
    this.uid,
    required this.username,
    required this.email,
    required this.phone,
  });

  toJson() {
    return {
      'username': username,
      'email': email,
      'phone': phone,
    };
  }

  factory UserModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    Map<String, dynamic> data = doc.data()!;
    return UserModel(
      uid: doc.id,
      username: data['username'],
      email: data['email'],
      phone: data['phone'],
    );
  }
}
