class Validator {
  String validateName(String value) {
    Pattern pattern = r'^[a-zA-Z]{3,}$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Name should contain letters only';
    else if (value.length < 3)
      return 'Name must have atleat 3 letters';
    else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty) {
      return null;
    } else {
      if (!regex.hasMatch(value))
        return 'Enter valid Email or leave it empty';
      else
        return null;
    }
  }

  String validateNumber(String value) {
    Pattern pattern = r'^[6-9]\d{9}$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter valid Phone number';
    else
      return null;
  }
}

final Validator validator = Validator();
