import 'package:flutter/material.dart';

class ProductColor {
/*  static bool _darkThemeActivated = false;

  static void updateTheme({required bool darkThemeActivated}) {
    _darkThemeActivated = darkThemeActivated;
  }

  static get backgroundColor =>
      {_darkThemeActivated ? _productWhite : _productBlack};

  static get textColor =>
      {_darkThemeActivated ? _productWhite : _productBlack};*/

  static const _darkBlue = Color(0xFF18344a);
  static const _black = Color(0xFF29293A);
  static const _white = Colors.white;
  static const _green = Colors.green;
  static const _darkWhite = Colors.white70;
  static const _redAccent = Colors.redAccent;
  static const _bodyBackground = Colors.cyan;
  static const _alertBoxBackgroundColor = _bodyBackground;

  static const _appBarBackgroundColor = _redAccent;

  static get darkBlue => _darkBlue;

  static get black => _black;

  static get white => _white;

  static get darkWhite => _darkWhite;

  static get green => _green;

  static get redAccent => _redAccent;

  static get appBarBackgroundColor => _appBarBackgroundColor;

  static get bodyBackground => _bodyBackground;

  static get alertBoxBackgroundColor => _alertBoxBackgroundColor;
  final Color facebookColor = const Color(0xff39579A);
  final Color twitterColor = const Color(0xff00ABEA);
  final Color instaColor = const Color(0xffBE2289);
  final Color whatsappColor = const Color(0xff075E54);
  final Color linkedinColor = const Color(0xff0085E0);
  final Color githubColor = const Color(0xff202020);
  final Color googleColor = const Color(0xffDF4A32);
  static final Color buttonColor = Colors.deepOrange.shade600;
  static final Color buttonHighlightColor = Colors.deepOrange.shade400;
  static const Color upperGradientColor = Colors.orangeAccent;
  static final Color lowerGradientColor = Colors.deepOrange.shade800;
}
