class ValidInputs {
  ValidInputs._();
  static String? validatePassword({required String password}) {
    String errorMessage = "";
    if (password.isEmpty) {
      return "The field is required";
    }
    if (password.length < 8) {
      errorMessage += 'The minimum is 8 characters';
    }
    // if (!password.contains(RegExp(r'[A-Z]'))) {
    //   errorMessage += 'Uppercase letter is missing.\n';
    // }
    // if (!password.contains(RegExp(r'[a-z]'))) {
    //   errorMessage += 'Lowercase letter is missing.\n';
    // }
    // if (!password.contains(RegExp(r'[0-9]'))) {
    //   errorMessage += 'Digit is missing.\n';
    // }
    // if (!password.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
    //   errorMessage += 'Special character is missing.\n';
    // }
    return errorMessage.isEmpty ? null : errorMessage;
  }

  static String? validateEmail(String s, {required String email}) {
    if (email.isEmpty) {
      return "The field is required";
    }
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
      return "Invalid e-mail address";
    }
    return null;
  }

  static String? matchPassword({
    required String value1,
    required String value2,
    String validMessage = "Passwords do not match",
    required String password,
  }) {
    if (value1.trim() != value2.trim() || value1.isEmpty || value2.isEmpty) {
      return validMessage;
    }
    return null;
  }

  static String? validateEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "The field is required";
    }
    return null;
  }

  static String? validatePhoneNumber(String? phone) {
    if (phone == null || phone.trim().isEmpty) {
      return "The field is required";
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(phone)) {
      return "Phone number must contain digits only";
    }
    if (phone.length == 9) {
      return "Phone number length must be 10 digits";
    }
    return null;
  }
}
