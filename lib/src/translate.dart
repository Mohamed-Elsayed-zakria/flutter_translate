import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class Translate {
  Locale locale;
  Translate(this.locale);

  static Translate of(BuildContext context) {
    return Localizations.of<Translate>(context, Translate)!;
  }

  static LocalizationsDelegate<Translate> delegate =
      _AppLocalizationsDelegate();

  late Map<String, String> jsonStrings;

  Future loadLangJson() async {
    String strings = await rootBundle
        .loadString('assets/languages/${locale.languageCode}.json');
    Map<String, dynamic> jsons = json.decode(strings);
    jsonStrings = jsons.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  String key(String key) => jsonStrings[key] ?? key;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<Translate> {
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<Translate> load(Locale locale) async {
    Translate appLocalizations = Translate(locale);
    await appLocalizations.loadLangJson();
    return appLocalizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<Translate> old) => false;
}
