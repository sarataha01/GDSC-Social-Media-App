import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/post_model.dart';
import 'user_services.dart';

class PostServices {
  static Stream<List<PostModel>> getPosts() {
    return FirebaseFirestore.instance
        .collection('User Posts')
        .orderBy('time', descending: true)
        .snapshots()
        .map((snapshot) {
      debugPrint("Retrieved ${snapshot.docs.length} posts");
      return snapshot.docs.map((doc) => PostModel.fromMap(doc.data())).toList();
    });
  }

  static Future<void> addPost(PostModel post) {
    return FirebaseFirestore.instance
        .collection('User Posts')
        .add(post.toJson());
  }

  static Future<void> userPostInfo() async {
    final String userUid = FirebaseAuth.instance.currentUser!.uid;
    final String email = FirebaseAuth.instance.currentUser!.email!;
    final String name = await UserServices.getName(email);
    final String username = await UserServices.getUsername(email);
    final PostModel newPost = PostModel(
      name: name,
      userName: username,
      time: DateTime.now(),
      text: "This is a new post!",
      image: null,
      likes: 0,
      comments: 0,
      shares: 0,
      userUid: userUid,
    );
    try {
      await PostServices.addPost(newPost);
      final String? uid = await UserServices.getUserUID();
      debugPrint(uid);
      debugPrint('Post created successfully!');
    } catch (e) {
      debugPrint('Failed to create post: $e');
    }
  }
}
