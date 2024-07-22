import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserServices {
  static Future<String?> getUserUID() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    // Check if the user is signed in
    if (auth.currentUser != null) {
      String uid = auth.currentUser!.uid;
      debugPrint('User UID: $uid');
      return uid;
    } else {
      debugPrint('User is not signed in');
      return null;
    }
  }

  static Future<String> getUsername(String username) async {
    try {
      final collection = FirebaseFirestore.instance.collection('users');
      final query =
          await collection.where('username', isEqualTo: username).get();

      if (query.docs.isNotEmpty) {
        // Username exists
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
}
