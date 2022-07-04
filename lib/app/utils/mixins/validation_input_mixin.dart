// part of 'app_mixins.dart';
part of app_mixins;

/// use this mixin for all form field
mixin ValidatorMixin {
  String? isValidEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required ";
    }
    // else if (!value.contains("@")) {
    //   return "Invalid Email";
    // }
    else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
        .hasMatch(value)) {
      return "Invalid Email";
    }
    return null;
  }

  String? isValidPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Password is required";
    } else if (value.length > 10 || value.length < 6) {
      return "Password at least 6-10 character";
    } else if (value.split(" ").length > 1) {
      return "Invalid Password";
    }

    return null;
  }

  String? isValidName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Name is required";
    } else if (value.split(" ").length > 1) {
      return "Invalid Name";
    }
    return null;
  }

  String? isValidPhoneNo(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Phone No is required";
    } else if (!RegExp(r'(^(?:[+88]0)?[0-9]{10,12}$)').hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    // else if (value.length < 11) {
    //   return "Phone no at least 11 character";
    // }
    return null;
  }
}
