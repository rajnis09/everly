class Validator {
  String _password;

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter valid Email';
    else
      return null;
  }

  String validatePassword(String value) {
    Pattern pattern =
        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{5,}$';
    RegExp regex = new RegExp(pattern);
    _password = value;
    if (!regex.hasMatch(value))
      return 'Length must be of atleast 5 character\nMust contain atleast one letter, one number and one special character';
    else
      return null;
  }

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

  String validateNumber(String value) {
    Pattern pattern = r'^[6-9]\d{9}$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter valid Phone number';
    else
      return null;
  }

  String validateConfirmPassword(String value) {
    if (value == _password) {
      return null;
    } else {
      return 'Both password does not match';
    }
  }
}

final Validator validator = Validator();
