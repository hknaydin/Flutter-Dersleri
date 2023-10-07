class Validation {
  static const int tcCharacterSize = 11;
  static const int maxNumberCharacterSize = 30;
  static const int maxPasswordCharacterSize = 15;

  bool validateIpAddress(String ipAddress) {
    final ipAddressRegex = RegExp(
        r'^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$');
    return ipAddressRegex.hasMatch(ipAddress);
  }

  bool isEmailValid(String email) {
    // E-posta adresi için regex deseni
    final pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    final regExp = RegExp(pattern);

    return regExp.hasMatch(email);
  }
}
