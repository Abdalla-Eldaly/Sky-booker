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
      getRegularStyle(
        fontFamily: AppLanguages.getSecondaryFont(context),
        color: ColorManager.grey.withOpacity(.6),
        fontSize: FontSize.f16,
      );

  static TextStyle textFieldTextStyle(BuildContext context) =>
      getSemiBoldStyle(
        fontFamily: AppLanguages.getSecondaryFont(context),
        color: ColorManager.black.withOpacity(.9),
        fontSize: FontSize.f16,
      );

// dialog
  static TextStyle boldHintTextFieldTextStyle(BuildContext context) =>
      getRegularStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: ColorManager.grey,
        fontSize: FontSize.f18,
      );
  
  static TextStyle dialogHeaderTextStyle(BuildContext context) =>
      getSemiBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: ColorManager.black,
        fontSize: FontSize.f20,
      );

  static TextStyle dialogBodyTextStyle(BuildContext context) =>
      getMediumStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: ColorManager.black,
        fontSize: FontSize.f16,
      );
  
  
  //general 
  static TextStyle generalTitleTextStyle(BuildContext context) =>
      getMediumStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: ColorManager.black.withOpacity(.8),
        fontSize: FontSize.f18,
      );
  
  static TextStyle generalSubTitleTextStyle(BuildContext context) =>
      getMediumStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: ColorManager.black.withOpacity(.5),
        fontSize: FontSize.f15,
      );



}