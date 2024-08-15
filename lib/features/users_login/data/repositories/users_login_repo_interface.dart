import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/core/api_tools/failure.dart';

abstract class UsersLoginRepoInterface {
  Future<Either<Failure, void>> login(
    BuildContext context,
    GlobalKey<FormState> formKey,
    TextEditingController usernameCTRL,
    TextEditingController passCTRL,
  );

  Future<String> getEmail(String username);
}
