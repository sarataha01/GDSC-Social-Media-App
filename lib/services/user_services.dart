import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../core/entities/user_model.dart';

class UserServices {
  static Future<String?> getUserUID() async {
    if (FirebaseAuth.instance.currentUser != null) {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      debugPrint('User UID: $uid');
      return uid;
    } else {
      debugPrint('User is not signed in');
      return null;
    }
  }

  static Future<String> getName(String email) async {
    try {
      final collection = FirebaseFirestore.instance.collection('users');
      final query = await collection.where('email', isEqualTo: email).get();

      if (query.docs.isNotEmpty) {
        final userDocument = query.docs.first;
        debugPrint('found');
        return userDocument.get('name') ?? 'name not available';
      } else {
        debugPrint('not found name');

        return 'No name found';
      }
    } catch (e) {
      debugPrint('Error fetching name: $e');
      return 'Error occurred';
    }
  }

  static Future<String> getUsername(String email) async {
    try {
      final collection = FirebaseFirestore.instance.collection('users');
      final query = await collection.where('email', isEqualTo: email).get();

      if (query.docs.isNotEmpty) {
        final userDocument = query.docs.first;
        debugPrint('found');
        return userDocument.get('username') ?? 'username not available';
      } else {
        debugPrint('not found username');

        return 'No username found';
      }
    } catch (e) {
      debugPrint('Error fetching username: $e');
      return 'Error occurred';
    }
  }

  static Future<String> getPhone(String email) async {
    try {
      final collection = FirebaseFirestore.instance.collection('users');
      final query = await collection.where('email', isEqualTo: email).get();

      if (query.docs.isNotEmpty) {
        final userDocument = query.docs.first;
        debugPrint('found');
        return userDocument.get('phone') ?? 'phone not available';
      } else {
        debugPrint('not found phone');

        return 'No phone found';
      }
    } catch (e) {
      debugPrint('Error fetching phone: $e');
      return 'Error occurred';
    }
  }

  static Stream<List<UserModel>> fetchUserStream() {
    final firestore = FirebaseFirestore.instance;
    final usersCollection = firestore.collection('users');

    return usersCollection.snapshots().map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return UserModel.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }

  static Future<void> getAllInfo(BuildContext context) async {
    try {
      final String email = FirebaseAuth.instance.currentUser!.email!;
      final name = await UserServices.getName(email);
      final username = await UserServices.getUsername(email);
      final phone = await UserServices.getPhone(email);
      final userModel = UserModel(
        name: name,
        username: username,
        email: email,
        phone: phone,
      );
      if (context.mounted) {
        Navigator.of(context).pushNamed('/Profile', arguments: userModel);
      }
    } catch (e) {
      print('Error retrieving user data: $e');
    }
  }
}
