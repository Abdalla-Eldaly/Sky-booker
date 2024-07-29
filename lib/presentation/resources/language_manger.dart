import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';

import 'font_manger.dart';

enum Languages { ar, en }

Languages appLanguage = Languages.en;

class AppLanguages {
  static const List<Locale> locals = [Locale('en', 'US'), Locale('ar', '')];
  static const Locale startLocal = Locale('en', 'US');
  static const Locale fallBackLocal = Locale('en', 'US');
  static String translationsPath = 'assets/translations';

  static void init(BuildContext context) {
    appLanguage = getCurrentLang(context);
  }

  static void toggleLocal(BuildContext context) async {
    if (context.locale == locals.first) {
      context.setLocale(locals.last);
      appLanguage = Languages.ar;
    } else {
      appLanguage = Languages.en;
      context.setLocale(locals.first);
    }
  }

  static void setLanguageArabic(BuildContext context) {
    context.setLocale(locals.last);
    appLanguage = Languages.ar;
  }

  static void setLanguageEnglish(BuildContext context) {
    context.setLocale(locals.first);
    appLanguage = Languages.en;
  }

  static String getCurrentLocal(BuildContext context) {
    return context.locale.languageCode;
  }

  static String getPrimaryFont(BuildContext context) {
    Languages language = getCurrentLang(context);
    return language == Languages.ar
        ? FontConstants.primaryArabicFont
        : FontConstants.primaryEnglishFont;
  }

  static String getSecondaryFont(BuildContext context) {
    Languages language = getCurrentLang(context);
    return language == Languages.ar
        ? FontConstants.secondaryArabicFont
        : FontConstants.secondaryEnglishFont;
  }

  static Languages getCurrentLang(BuildContext context) {
    switch (getCurrentLocal(context)) {
      case 'en':
        return Languages.en;
      case 'ar':
        return Languages.ar;
      default:
        return Languages.en;
    }
  }

  static TextDirection getCurrentTextDirection(BuildContext context) {
    return context.locale.languageCode == 'ar'
        ? TextDirection.rtl
        : TextDirection.ltr;
  }
}
