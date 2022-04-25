mixin Validators {
  String? validateEmail(String? value) {
    if (!value!.contains('@')) {
      return 'Please enter a valid email';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value != null) {
      if (value.length < 6) {
        return 'Password should be atleast 6 letters';
      }
      return null;
    }
    return null;
  }
}
