import 'package:flutter/material.dart';
import 'package:github_demo/screens/home_screen.dart';
import 'package:github_demo/utils/colors.dart';

void main() {
  runApp(new MaterialApp(
    home: Home_screen(),
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
      primaryColor: AppColors.primary,
    ),
  ));
}