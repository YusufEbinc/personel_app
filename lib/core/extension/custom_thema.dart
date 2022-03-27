import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personel_app/core/extension/color.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: scafoldbackclr,
    textTheme: GoogleFonts.quicksandTextTheme(),
    appBarTheme: appBarTheme(),
    toggleableActiveColor: blackColor,
    unselectedWidgetColor: blackColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    elevation: 2,
    color: whiteColor,
    titleTextStyle: TextStyle(color: blackColor, fontSize: 23),
    centerTitle: true,
    iconTheme: IconThemeData(color: blackColor, size: 30),
  );
}
