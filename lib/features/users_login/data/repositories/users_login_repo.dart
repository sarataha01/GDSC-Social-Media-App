import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/core/api_tools/failure.dart';
import 'package:gdsc_social_media_app/features/users_login/data/repositories/users_login_repo_interface.dart';

class UsersLoginRepo implements UsersLoginRepoInterface {
  @override
  Future<Either<Failure, void>> login(
    BuildContext context,
    GlobalKey<FormState> formKey,
    TextEditingController usernameCTRL,
    TextEditingController passCTRL,
  ) async {
    String password = passCTRL.text;
    String username = usernameCTRL.text;

    if (formKey.currentState!.validate()) {
      try {
        String foundEmail = await getEmail(username);

        if (foundEmail == 'No email found' ||
            foundEmail == 'Error occurred' ||
            foundEmail == 'Email not available') {
          return Left(Failure(foundEmail));
        }

        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: foundEmail,
          password: password,
        );
        if (context.mounted) {
          Navigator.pushNamed(context, '/Homepage');
        }
        return const Right(null);
      } catch (error) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Invalid username/password')),
          );
        }
        debugPrint('Error: ${error.toString()}');
        return Left(Failure('Invalid username/password'));
      }
    }

    return Left(Failure('Form validation error'));
  }

  @override
  Future<String> getEmail(String username) async {
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
}
