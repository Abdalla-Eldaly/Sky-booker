import 'package:flutter/material.dart';
import 'package:sky_booker/presentation/resources/style_manger.dart';
import 'color_manager.dart';
import 'font_manger.dart';
import 'language_manger.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle baseStatesMessageTextStyle(BuildContext context,
      [Color? textColor]) =>
      getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: textColor ?? ColorManager.white,
        fontSize: FontSize.f22,
      );

  static TextStyle baseStatesElevatedBtnTextStyle(BuildContext context) =>
      getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: ColorManager.white,
        fontSize: FontSize.f14,
      );


  // hint Text
  static TextStyle hintTextFieldTextStyle(BuildContext context) =>
      getBoldStyle(
        fontFamily: AppLanguages.getSecondaryFont(context),
        color: ColorManager.grey.withOpacity(.8),
        fontSize: FontSize.f16,
      );


}