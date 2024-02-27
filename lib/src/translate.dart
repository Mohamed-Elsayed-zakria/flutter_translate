import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class Translate {
  final Locale? _locale;
  Translate(this._locale);

  static Translate of(BuildContext context) {
    return Localizations.of<Translate>(context, Translate)!;
  }

  static final LocalizationsDelegate<Translate> _delegate =
      _AppLocalizationsDelegate();

  late Map<String, String> _jsonStrings;

  Future loadLangJson() async {
    String strings = await rootBundle
        .loadString('assets/languages/${_locale!.languageCode}.json');
    Map<String, dynamic> jsons = json.decode(strings);
    _jsonStrings = jsons.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  String translate(String key) => _jsonStrings[key] ?? key;

  String getCurrentLanguage(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);
    String currentLanguage = currentLocale.languageCode;
    return currentLanguage;
  }

  static Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates = [
    Translate._delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
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
