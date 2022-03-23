import 'package:flutter/material.dart';
import 'package:personel_app/core/extension/color.dart';

ThemeData theme() {
  return ThemeData(
    fontFamily: "primaryFont",
    scaffoldBackgroundColor: scafoldbackclr,
    textTheme: const TextTheme(
        bodyText1: TextStyle(color: greyColor, fontSize: 15),
        bodyText2: TextStyle(color: greyColor, fontSize: 15),
        subtitle1: TextStyle(color: greyColor, fontSize: 15),
        subtitle2: TextStyle(color: greyColor, fontSize: 15),
        button: TextStyle(color: greyColor, fontSize: 15)),
    //   primaryColor: whiteColor,
    appBarTheme: appBarTheme(),
    toggleableActiveColor: greyColor,
    unselectedWidgetColor: greyColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    elevation: 2,
    color: whiteColor,
    centerTitle: true,
    titleTextStyle: TextStyle(color: blackColor),
    iconTheme: IconThemeData(color: blackColor),
  );
}
