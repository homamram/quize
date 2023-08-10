bool isEmail(String value) {
  RegExp regExp = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  return regExp.hasMatch(value);
}

bool isPasswordValid(String value) {
  RegExp regExp =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  return regExp.hasMatch(value);
}
 bool   isSyriaNumber(String mobileNumber) {
  RegExp regex = RegExp(r'^(!?(\+|00)?(963)|0)?9\d{8}$');
  return regex.hasMatch(mobileNumber);
}
