import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? uid;
  final String name;
  final String username;
  final String email;
  final String phone;

  UserModel({
    this.uid,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'email': email,
      'phone': phone,
    };
  }

  factory UserModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    Map<String, dynamic> data = doc.data()!;
    return UserModel(
      uid: doc.id,
      name: data['name'],
      username: data['username'],
      email: data['email'],
      phone: data['phone'],
    );
  }
}
