class Validators {
  static String? checkLengthValidator(String? input, int minCharacters) {
    if (input == null) {
      return 'Input not found.';
    }
    if (input.length <= minCharacters) {
      return 'Input cannot be less than 7 characters';
    }
    return null;
  }
}
