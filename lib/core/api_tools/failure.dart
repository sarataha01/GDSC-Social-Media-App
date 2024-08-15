class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class UserNotSignedInFailure extends Failure {
  UserNotSignedInFailure(super.message);
}

class UserHasNoAccount extends Failure {
  UserHasNoAccount(super.message);
}
