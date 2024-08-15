import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../core/utils/share_new_post.dart';
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
        .doc(post.postId)
        .set(post.toJson());
  }

  static Future<void> userPostInfo(
    String postImage,
    String caption,
  ) async {
    final String userUid = FirebaseAuth.instance.currentUser!.uid;
    final String email = FirebaseAuth.instance.currentUser!.email!;
    final String name = await UserServices.getName(email);
    final String username = await UserServices.getUsername(email);
    final String postId =
        FirebaseFirestore.instance.collection('User Posts').doc().id;
    final PostModel newPost = PostModel(
      postId: postId,
      name: name,
      userName: username,
      time: DateTime.now(),
      text: caption,
      image: postImage,
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

  static Future<void> createPost(
      BuildContext context, File file, String caption) async {
    try {
      final postUrl = await StoreToFirebase.uploadImage('User Posts', file);
      await PostServices.userPostInfo(postUrl, caption);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Post uploaded successfully!')),
        );
        Navigator.pop(context);
        Navigator.pop(context);
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  static Future<void> deletePost(String postId) async {
    try {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        await FirebaseFirestore.instance
            .collection('User Posts')
            .doc(postId)
            .delete();
      });
    } catch (e) {
      throw Exception("Error deleting post: $e");
    }
  }

  static Future<void> toggleLikes(PostModel post, int likeCount) async {
    await FirebaseFirestore.instance
        .collection('User Posts')
        .doc(post.postId)
        .update({
      'likedBy': post.likedBy,
      'likes': likeCount,
    });
  }
}
