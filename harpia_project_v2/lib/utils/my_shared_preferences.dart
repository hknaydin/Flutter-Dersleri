import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static String LOCALNAME = "localName";
  static String ADMINUSERNAME = "username";
  static String ADMINUSERNAMEPASSWORD = "userpassword";

  static Future<Null> setLocalName(String localName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(MySharedPreferences.LOCALNAME, localName);
  }

  static Future<String> getLocalName() async {
    String localName;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    localName = prefs.getString(MySharedPreferences.LOCALNAME) ?? '-1';
    return localName;
  }

  static void setAdminUserName(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(MySharedPreferences.ADMINUSERNAME, userName);
  }

  static Future<String> getAdminUserName() async {
    String userName;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName = prefs.getString(MySharedPreferences.ADMINUSERNAME) ?? '-1';
    return userName;
  }

  static void setAdminUserPassword(String userPassword) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(MySharedPreferences.ADMINUSERNAMEPASSWORD, userPassword);
  }

  static Future<String> getAdminUserPassword() async {
    String userPassword;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userPassword =
        prefs.getString(MySharedPreferences.ADMINUSERNAMEPASSWORD) ?? '-1';
    return userPassword;
  }
}
