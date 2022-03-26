import 'package:flutter/material.dart';
import 'package:personel_app/core/extension/color.dart';

ThemeData theme() {
  return ThemeData(
    fontFamily: "primaryFont",
    scaffoldBackgroundColor: scafoldbackclr,
    textTheme: TextTheme(
      bodyText1: TextStyle(color: blackColor.withOpacity(.7), fontSize: 15),
    ),
    appBarTheme: appBarTheme(),
    toggleableActiveColor: blackColor,
    unselectedWidgetColor: blackColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    elevation: 2,
    color: whiteColor,
    centerTitle: true,
    titleTextStyle: TextStyle(color: blackColor.withOpacity(.8), fontSize: 20),
    iconTheme: const IconThemeData(color: blackColor, size: 30),
  );
}
