class Validation {
  bool validateIpAddress(String ipAddress) {
    final RegExp ipRegExp = RegExp(
      r'^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.'
      r'([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.'
      r'([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.'
      r'([01]?\\d\\d?|2[0-4]\\d|25[0-5])$',
    );
    return ipRegExp.hasMatch(ipAddress);
  }
}
