import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static String LOCALNAME = "localName";
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
}
