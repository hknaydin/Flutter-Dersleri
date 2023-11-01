import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.red,
  primaryColor: Colors.white,
  backgroundColor: Color(0xffF1F5FB),
  indicatorColor: Color(0xffCBDCF8),
  hintColor: Color(0xffEECED3),
  highlightColor: Color(0xffFCE192),
  hoverColor: Color(0xff4285F4),
  focusColor: Color(0xffA8DAB5),
  disabledColor: Colors.grey,
  cardColor: Colors.white,
  canvasColor: Colors.grey[50],
  brightness: Brightness.light,
);
ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
