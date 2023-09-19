import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Language {
  static const _defaultLanguageCode = 'en'; // Varsayılan dil kodu

  static const supportedLanguages = [
    'en',
    'tr',
    'fr',
    'zh'
  ]; // Desteklenen dillerin listesi

  static Future<Locale> getLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode =
        prefs.getString('languageCode') ?? _defaultLanguageCode;
    return Locale(languageCode);
  }

  static Future<void> setLocale(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', languageCode);
  }
}
