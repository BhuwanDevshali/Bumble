class Validators {
  static String validateName(String value) {
    if (value.isEmpty) {
      return 'Name cannot be empty';
    } else if (value.length < 3) {
      return 'Name must be at least 3 characters long';
    } else if (value.length > 50) {
      return 'Name must be less than 50 characters long';
    } else {
      return null;
    }
  }

  static String validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email cannot be empty';
    } else if (!value.contains('@')) {
      return 'Please enter a valid email address';
    } else {
      return null;
    }
  }

  static String validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    } else {
      return null;
    }
  }

  static String validateAge(String value) {
    if (value.isEmpty) {
      return 'Age cannot be empty';
    } else if (int.tryParse(value) < 18) {
      return 'You must be at least 18 years old';
    } else {
      return null;
    }
  }
}