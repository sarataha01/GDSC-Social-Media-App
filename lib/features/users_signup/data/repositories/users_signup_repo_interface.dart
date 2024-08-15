import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/core/api_tools/failure.dart';

import '../../../../core/entities/user_model.dart';

abstract class UsersSignupRepoInterface {
  Future<Either<Failure, void>> signUp(
    BuildContext context,
    GlobalKey<FormState> formKey,
    TextEditingController nameCTRL,
    TextEditingController usernameCTRL,
    TextEditingController passCTRL,
    TextEditingController phoneCTRL,
    TextEditingController emailCTRL,
  );
  Future<Either<Failure, void>> addUserData(
      BuildContext context, String? uid, UserModel user);
}
