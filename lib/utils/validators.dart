mixin Validators {
  String? validateEmail(String? value) {
    if (!value!.contains('@')) {
      return 'Please enter a valid email';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value!.length > 6) {
      return 'Please enter a valid password';
    }

    return null;
  }
}
