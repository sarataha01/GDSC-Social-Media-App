import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

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

  static Future<String> getEmail(String username) async {
    try {
      final collection = FirebaseFirestore.instance.collection('users');
      final query =
          await collection.where('username', isEqualTo: username).get();

      if (query.docs.isNotEmpty) {
        final userDocument = query.docs.first;
        debugPrint('found username');
        return userDocument.get('email') ?? 'Email not available';
      } else {
        debugPrint('not found username');

        return 'No email found';
      }
    } catch (e) {
      debugPrint('Error fetching username: $e');
      return 'Error occurred';
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

  static void addUserData(BuildContext context, String? uid, UserModel user) {
    if (uid != null) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .set(user.toJson())
          .whenComplete(() {
        debugPrint("Data inserted for UID: $uid");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sign up successful')),
        );
        Navigator.pushNamed(context, '/Homepage');
      }).catchError((error) {
        debugPrint('Firestore Error: ${error.toString()}');
      });
    } else {
      debugPrint("User UID not available. Cannot add user data.");
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
}
