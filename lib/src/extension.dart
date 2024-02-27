import 'package:flutter_translate/src/translate.dart';
import 'package:flutter/material.dart';

extension TranslateX on String {
  String tr(BuildContext context) {
    return Translate.of(context).translate(this);
  }
}
