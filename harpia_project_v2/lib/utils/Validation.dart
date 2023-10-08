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

  bool isStrongPassword(String password) {
    // Parola uzunluğu kontrolü
    if (password.length < 8) {
      return false;
    }

    // En az bir büyük harf kontrolü
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return false;
    }

    // En az bir küçük harf kontrolü
    if (!password.contains(RegExp(r'[a-z]'))) {
      return false;
    }

    // Rakam kontrolü
    if (!password.contains(RegExp(r'[0-9]'))) {
      return false;
    }

    // Özel karakter kontrolü
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return false;
    }

    // Tüm kontrolleri geçtiyse parola güçlüdür
    return true;
  }
}
