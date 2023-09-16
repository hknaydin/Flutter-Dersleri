import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Flutter Localization Example',
      'greeting': 'Hello!',
      'farewell': 'Goodbye!',
    },
    'tr': {
      'title': 'Flutter Çokdillendirme Örneği',
      'greeting': 'Merhaba!',
      'farewell': 'Güle güle!',
    },
  };

  String get title {
    return _localizedValues[locale.languageCode]['title'];
  }

  String get greeting {
    return _localizedValues[locale.languageCode]['greeting'];
  }

  String get farewell {
    return _localizedValues[locale.languageCode]['farewell'];
  }
}