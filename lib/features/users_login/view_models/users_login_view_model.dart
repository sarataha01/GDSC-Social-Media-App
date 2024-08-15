import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/api_tools/failure.dart';
import '../data/repositories/users_login_repo_interface.dart';

class UsersLoginViewModel extends ChangeNotifier {
  bool _isLoading = false;
  Failure? _failure;

  final UsersLoginRepoInterface _repository;

  UsersLoginViewModel(this._repository);

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

  Future<void> logIn(
    BuildContext context,
    GlobalKey<FormState> formKey,
    TextEditingController usernameCTRL,
    TextEditingController passCTRL,
  ) async {
    _setLoading(true);

    final Either<Failure, void> result = await _repository.login(
      context,
      formKey,
      usernameCTRL,
      passCTRL,
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
