
import 'package:flutter/material.dart';

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

  static TextStyle get edittext => TextStyle(
    fontSize: 16,
    color: AppColors.title,
  );

  static TextStyle get hint_edittext => TextStyle(
    fontSize:16,
    color: AppColors.grey,
    fontFamily: FontFamily.light,
  );

  static TextStyle get button => TextStyle(
    fontSize:16,
    color: AppColors.white,
    fontFamily: FontFamily.regular,
  );


  static TextStyle get text_title => TextStyle(
    fontSize: 20,
    color: AppColors.white,
    fontFamily: FontFamily.regular,
  );
}
