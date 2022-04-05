// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ru = {
  "hi_text": "Привет!",
  "intro_screen1": "Быстро.Просто.Удобно",
    "intro_screen1_2": "Прямые переводы в Россию с карт Uzcard и Humo. Отправляй деньги на банковские карты России."


  };
static const Map<String,dynamic> uz = {
  "hi_text": "Salom!",
"intro_screen1": "Tez.Oson.Qulay",
  "intro_screen1_2": "Uzcard va Humo kartalaridan Rossiyaga to'g'ridan-to'g'ri pul o'tkazmalari. Rossiya bank kartalariga pul o'tkazing."


};
static const Map<String, Map<String,dynamic>> mapLocales = {"ru": ru, "uz": uz};
}
