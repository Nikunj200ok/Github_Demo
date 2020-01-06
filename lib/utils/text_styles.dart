
import 'package:flutter/material.dart';
import 'package:github_demo/utils/screen_util.dart';

import 'colors.dart';

class FontFamily {
  static String black = "Poppins-Black";
  static String bold = "Poppins-Bold";
  static String extrabold = "Poppins-ExtraBold";
  static String light = "Poppins-Light";
  static String medium = "Poppins-Medium";
  static String regular = "Poppins-Regular";
}

class TextStyles {

  static TextStyle get text_bold => TextStyle(
    fontSize: FontSize.s18,
    color: AppColors.title,
      fontFamily: FontFamily.bold
  );

  static TextStyle get hint_edittext => TextStyle(
    fontSize: FontSize.s16,
    color: AppColors.grey,
    fontFamily: FontFamily.light,
  );

  static TextStyle get button => TextStyle(
    fontSize: FontSize.s16,
    color: AppColors.white,
    fontFamily: FontFamily.regular,
  );


  static TextStyle get text_title => TextStyle(
    fontSize: FontSize.s20,
    color: AppColors.white,
    fontFamily: FontFamily.regular,
  );

  static TextStyle get text_small => TextStyle(
    fontSize: FontSize.s12,
    color: AppColors.title,
    fontFamily: FontFamily.regular,
  );

  static TextStyle get text_small_bold => TextStyle(
    fontSize: FontSize.s12,
    color: AppColors.title,
    fontFamily: FontFamily.bold,
  );
}
