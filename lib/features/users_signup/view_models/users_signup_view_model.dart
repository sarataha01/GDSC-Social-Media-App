import 'package:dartz/dartz.dart'; // For Either
import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/core/api_tools/failure.dart';
import 'package:gdsc_social_media_app/features/users_signup/data/repositories/users_signup_repo_interface.dart';

class UsersSignupViewModel extends ChangeNotifier {
  bool _isLoading = false;
  Failure? _failure;

  final UsersSignupRepoInterface _repository;

  UsersSignupViewModel(this._repository);

  bool get isLoading => _isLoading;
  Failure? get failure => _failure;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setFailure(Failure? value) {
    _failure = value;
    notifyListeners();
  }

  Future<void> signUp(
    BuildContext context,
    GlobalKey<FormState> formKey,
    TextEditingController nameCTRL,
    TextEditingController usernameCTRL,
    TextEditingController passCTRL,
    TextEditingController phoneCTRL,
    TextEditingController emailCTRL,
  ) async {
    _setLoading(true);

    final Either<Failure, void> result = await _repository.signUp(
      context,
      formKey,
      nameCTRL,
      usernameCTRL,
      passCTRL,
      phoneCTRL,
      emailCTRL,
    );

    result.fold(
      (failure) {
        _setFailure(failure);
      },
      (_) {
        _setFailure(null);
      },
    );

    _setLoading(false);
  }
}
