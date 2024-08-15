import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class StoreToFirebase {
  static final FirebaseStorage _storage = FirebaseStorage.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static var uid = const Uuid().v4();

  static Future<String> uploadImage(String name, File file) async {
    try {
      Reference ref =
          _storage.ref().child(name).child(_auth.currentUser!.uid).child(uid);

      UploadTask uploadTask = ref.putFile(file);
      uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
        debugPrint('Task state: ${snapshot.state}');
        debugPrint(
            'Progress: ${(snapshot.bytesTransferred / snapshot.totalBytes) * 100} %');
      }, onError: (e) {
        debugPrint('Error: $e');
      });
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      debugPrint('Error in uploadImage: $e');
      rethrow;
    }
  }
}
