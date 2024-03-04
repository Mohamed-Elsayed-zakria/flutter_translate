import 'package:flutter/material.dart';

class Language {
  static String currentLanguage(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);
    String currentLanguage = currentLocale.languageCode;
    return currentLanguage;
  }
}
