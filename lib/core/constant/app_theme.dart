import 'package:cadeau/core/constant/App_font.dart';
import 'package:cadeau/core/constant/app_color.dart';
import 'package:flutter/material.dart';

ThemeData englishTheme = ThemeData(
  scaffoldBackgroundColor: AppColor.background,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColor.background,
    elevation: 0,
    scrolledUnderElevation: 0,

    titleTextStyle: TextStyle(
      fontFamily: AppFonts.tajwal,
      color: AppColor.secondBlack,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontFamily: AppFonts.tajwal,
      color: AppColor.black,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      fontFamily: AppFonts.tajwal,
      color: AppColor.greyLight,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ),
);

ThemeData arabicTheme = ThemeData(
  scaffoldBackgroundColor: AppColor.background,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColor.background,
    elevation: 0,
    scrolledUnderElevation: 0,

    titleTextStyle: TextStyle(
      fontFamily: AppFonts.tajwal,
      color: AppColor.black,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontFamily: AppFonts.tajwal,
      color: AppColor.black,
      fontSize: 28,
      fontWeight: FontWeight.w600,
    ),
  ),
);
