class BaseHttpRequestConfig {
  static String localhost = "http://10.0.2.2:";
  static String _port = "8080";
  static String api = "/users/";
  static String baseUrlAddres = localhost + _port + api;

  static String get localHost => localhost;

  static String get port => _port;

  static String get baseUrl => baseUrlAddres;

  static String get apiVersion => api;
}
