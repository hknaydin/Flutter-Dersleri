import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/favorite.dart';

class MySharedPreferences {
  static String LOCALNAME = "localName";
  static String ADMINUSERNAME = "username";
  static String ADMINUSERNAMEPASSWORD = "userpassword";
  static String HOSPITALNAME = "hospitalname";
  static String HOSPITALINTERNALIP = "hospitalinternalip";
  static String HOSPITALEXTERNALIP = "hospitalexternalip";
  static String LOGINUSERNAME = "loginUserName";
  static String LOGINUSERPASSWORD = "loginUserPassword";
  static String BACKGROUNDCOLOR = "backgroundcolor";
  static String APPTHEME = "appTheme";
  static String APPFAVORITESTATE = "appFavoriteState";

  static Future<Null> setAppFavoriteState(Favorite state, String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> present =
        prefs.getStringList(MySharedPreferences.APPFAVORITESTATE) ??
            List<String>.empty(growable: true);
    state == Favorite.enabled ? present.add(id) : present.remove(id);
    prefs.setStringList(MySharedPreferences.APPFAVORITESTATE, present);
  }

  static Future<Favorite> getAppFavoriteState(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> present =
        prefs.getStringList('favorite') ?? List<String>.empty();
    return present.contains(id) ? Favorite.enabled : Favorite.disabled;
  }

  static Future<Null> setAppTheme(ThemeMode value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(MySharedPreferences.APPTHEME, value.index);
  }

  static Future<ThemeMode> getAppTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int index = prefs.getInt(MySharedPreferences.APPTHEME) ?? 1;

    return ThemeMode.values[index];
  }

  static Future<Null> setBackgroundColor(Color color) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(MySharedPreferences.BACKGROUNDCOLOR, color.value);
  }

  static Future<int> getBackgroundColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getInt(MySharedPreferences.BACKGROUNDCOLOR) ??
        Colors.white.value;
  }

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

  static void setLoginUserName(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(MySharedPreferences.LOGINUSERNAME, userName);
  }

  static Future<String> getLoginUserName() async {
    String userName;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName = prefs.getString(MySharedPreferences.LOGINUSERNAME) ?? '-1';
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
        prefs.getString(MySharedPreferences.ADMINUSERNAMEPASSWORD) ?? 'empty';
    return userPassword;
  }

  static void setLoginUserPassword(String userPassword) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(MySharedPreferences.LOGINUSERPASSWORD, userPassword);
  }

  static Future<String> getLoginUserPassword() async {
    String userPassword;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userPassword =
        prefs.getString(MySharedPreferences.LOGINUSERPASSWORD) ?? 'empty';
    return userPassword;
  }

  static void setHospitalName(String hospitalName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(MySharedPreferences.HOSPITALNAME, hospitalName);
  }

  static Future<String> getHospitalName() async {
    String hospitalName;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    hospitalName = prefs.getString(MySharedPreferences.HOSPITALNAME) ?? 'empty';
    return hospitalName;
  }

  static void setHospitalInternalIp(String hospitalInternalIp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(MySharedPreferences.HOSPITALINTERNALIP, hospitalInternalIp);
  }

  static Future<String> getHospitalInternalIp() async {
    String hospitalInternalIp;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    hospitalInternalIp =
        prefs.getString(MySharedPreferences.HOSPITALINTERNALIP) ?? 'empty';
    return hospitalInternalIp;
  }

  static void setHospitalExternalIp(String hospitalExternalIp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(MySharedPreferences.HOSPITALEXTERNALIP, hospitalExternalIp);
  }

  static Future<String> getHospitalExteralIp() async {
    String hospitalExternalIp;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    hospitalExternalIp =
        prefs.getString(MySharedPreferences.HOSPITALEXTERNALIP) ?? 'empty';
    return hospitalExternalIp;
  }
}
