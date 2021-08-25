import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final Color primaryColor = Color(0xffffffff);
final Color secondaryColor = Color(0xff2566ff);
final Color darkPrimaryColor = Color(0xFF263238);
final Color darkSecondaryColor = Color(0xff29b6f6);

ThemeData lightTheme = ThemeData(
  primaryColor: primaryColor,
  accentColor: secondaryColor,
  scaffoldBackgroundColor: Colors.white,
  textTheme: myTextTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(primary: secondaryColor, textStyle: TextStyle(), shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0))))),
  appBarTheme: AppBarTheme(
    textTheme: myTextTheme.apply(bodyColor: Colors.black),
    elevation: 0.3,
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: secondaryColor, unselectedItemColor: Colors.grey),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: darkPrimaryColor,
  accentColor: darkSecondaryColor,
  textTheme: myTextTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(primary: darkSecondaryColor, textStyle: TextStyle(), shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0))))),
  appBarTheme: AppBarTheme(
    textTheme: myTextTheme.apply(bodyColor: Colors.white70),
    elevation: 0,
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: darkSecondaryColor, unselectedItemColor: Colors.grey),
)


;

final TextTheme myTextTheme = TextTheme(
  headline1: GoogleFonts.martel(fontSize: 92, fontWeight: FontWeight.w900, letterSpacing: -0.6),
  headline2: GoogleFonts.martel(fontSize: 57, fontWeight: FontWeight.w900, letterSpacing: -0.2),
  headline3: GoogleFonts.martel(fontSize: 46, fontWeight: FontWeight.w900, letterSpacing: -0.4),
  headline4: GoogleFonts.martel(fontSize: 32, fontWeight: FontWeight.w900, letterSpacing: -0.3),
  headline5: GoogleFonts.martel(fontSize: 23, fontWeight: FontWeight.w800, letterSpacing: -0.5),
  headline6: GoogleFonts.martel(fontSize: 19, fontWeight: FontWeight.w800, letterSpacing: -0.5),
  subtitle1: GoogleFonts.martel(fontSize: 15, fontWeight: FontWeight.w700, letterSpacing: -0.5),
  subtitle2: GoogleFonts.martel(fontSize: 13, fontWeight: FontWeight.w700, letterSpacing: -0.5),
  bodyText1: GoogleFonts.biryani(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.5),
  bodyText2: GoogleFonts.biryani(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.25),
  button: GoogleFonts.biryani(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.25),
  caption: GoogleFonts.biryani(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  overline: GoogleFonts.biryani(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 0.25),
);
