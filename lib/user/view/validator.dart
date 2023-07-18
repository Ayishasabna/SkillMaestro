import 'dart:developer';

String checkUserName(String value) {
  if (value.isEmpty) {
    return 'Username is required';
  }
  return '';
}

String checkEmail(String value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  } else {
    var check = RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(value);
    if (!check) {
      return "invalid Email";
    }
  }
  return '';
}

String checkPass(String val) {
  if (val.isNotEmpty) {
    if (val.length < 6) {
      return "Password too short";
    }
    return '';
  } else
    return "Please enter Password ";
}

String confirmPassword(String value, String pass) {
  if (value.isNotEmpty) {
    if (value == pass) {
      return '';
    } else
      return "Password Does Not Match";
  } else
    return "Please confirm password";
}

String checkNumber(String val) {
  if (val.isNotEmpty) {
    if (val.length < 10) {
      log('________ffff___________$val');
      return "Enter 10 digit Phone Number ";
    } else
      return '';
  } else
    return "Please Enter Phone Number";
}

String checkdescription(String val) {
  if (val.isNotEmpty) {
    if (val.length < 20) {
      return "Description Too Short";
    } else
      return '';
  } else
    return "Please Enter Description";
}

String checkLength(String val) {
  if (val.isNotEmpty)
    return '';
  else
    return "PLease Fill all the fields";
}
