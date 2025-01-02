import 'package:event_plannig/my_app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
        color: MyAppColors.primary,
        iconTheme: IconThemeData(color: MyAppColors.black)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            padding: EdgeInsets.all(16))),
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(backgroundColor: MyAppColors.primary),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: MyAppColors.primary,
        elevation: 0,
        shape:
            CircleBorder(side: BorderSide(color: MyAppColors.white, width: 3))),
    textTheme: TextTheme(
      headlineSmall: GoogleFonts.inter(
          color: MyAppColors.primary, fontWeight: FontWeight.w700, fontSize: 20,
          decoration: TextDecoration.none),
      headlineMedium:GoogleFonts.inter(
        color: MyAppColors.primary,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        decoration: TextDecoration.underline,
          decorationColor: MyAppColors.primary
      ),
      headlineLarge: GoogleFonts.inter(
          color: MyAppColors.primary,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        decoration: TextDecoration.none
        ),
      titleSmall: GoogleFonts.inter(
          color: MyAppColors.primary,
          fontWeight: FontWeight.w700,
          fontSize: 20,
          decoration: TextDecoration.none),
      titleLarge: GoogleFonts.inter(
          color: MyAppColors.white, fontWeight: FontWeight.w700, fontSize: 24,
          decoration: TextDecoration.none),
      titleMedium: GoogleFonts.inter(
          color: MyAppColors.black, fontWeight: FontWeight.w700, fontSize: 20,
          decoration: TextDecoration.none),
      bodySmall: GoogleFonts.inter(
          fontWeight: FontWeight.w500, color: MyAppColors.black, fontSize: 16,
          decoration: TextDecoration.none),
      bodyMedium: GoogleFonts.inter(
          fontWeight: FontWeight.w500, color: MyAppColors.white, fontSize: 16,
          decoration: TextDecoration.none),
      bodyLarge: GoogleFonts.inter(
          fontWeight: FontWeight.w500, color: MyAppColors.gray, fontSize: 14,
          decoration: TextDecoration.none),
      displayLarge: GoogleFonts.inter(
          fontWeight: FontWeight.w400, color: MyAppColors.white, fontSize: 14,
          decoration: TextDecoration.none),
      displayMedium: GoogleFonts.inter(
          fontWeight: FontWeight.w700, color: MyAppColors.black, fontSize: 14,
          decoration: TextDecoration.none),
      displaySmall: GoogleFonts.inter(
          fontWeight: FontWeight.w700,
          color: MyAppColors.primary,
          fontSize: 14,
          decoration: TextDecoration.none),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    bottomSheetTheme:
        BottomSheetThemeData(backgroundColor: MyAppColors.darktheme),
    scaffoldBackgroundColor: MyAppColors.darktheme,
    appBarTheme: AppBarTheme(
        color: MyAppColors.darktheme,
        iconTheme: IconThemeData(color: MyAppColors.primary)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: MyAppColors.primary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            padding: EdgeInsets.all(16))),
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(backgroundColor: MyAppColors.darktheme),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: MyAppColors.darktheme,
        elevation: 0,
        shape: CircleBorder(side: BorderSide(color: MyAppColors.white,width: 3))),
    textTheme: TextTheme(
      headlineSmall: GoogleFonts.inter(
          color: MyAppColors.primary, fontWeight: FontWeight.w700, fontSize: 20,
          decoration: TextDecoration.none),
      headlineMedium:GoogleFonts.inter(
          color: MyAppColors.primary,
          fontWeight: FontWeight.w500,
          fontSize: 16,
          decoration: TextDecoration.underline,
          decorationColor: MyAppColors.primary
      ),
      headlineLarge: GoogleFonts.inter(
          color: MyAppColors.white,
          fontWeight: FontWeight.w500,
          fontSize: 16,
          decoration: TextDecoration.none),
      titleSmall: GoogleFonts.inter(
          color: MyAppColors.primary,
          fontWeight: FontWeight.w700,
          fontSize: 20,
          decoration: TextDecoration.none),
      titleLarge: GoogleFonts.inter(
          color: MyAppColors.white, fontWeight: FontWeight.w700, fontSize: 24,
          decoration: TextDecoration.none),
      titleMedium: GoogleFonts.inter(
          color: MyAppColors.white, fontWeight: FontWeight.w700, fontSize: 20,
          decoration: TextDecoration.none),
      bodySmall: GoogleFonts.inter(
          fontWeight: FontWeight.w500, color: MyAppColors.white, fontSize: 16,
          decoration: TextDecoration.none),
      bodyMedium: GoogleFonts.inter(
          fontWeight: FontWeight.w500, color: MyAppColors.white, fontSize: 16,
          decoration: TextDecoration.none),
      bodyLarge: GoogleFonts.inter(
          fontWeight: FontWeight.w500, color: MyAppColors.white, fontSize: 14,
          decoration: TextDecoration.none),
      displayLarge: GoogleFonts.inter(
          fontWeight: FontWeight.w400, color: MyAppColors.white, fontSize: 14,
          decoration: TextDecoration.none),
      displayMedium: GoogleFonts.inter(
          fontWeight: FontWeight.w700, color: MyAppColors.white, fontSize: 14,
          decoration: TextDecoration.none),
      displaySmall: GoogleFonts.inter(
          fontWeight: FontWeight.w700,
          color: MyAppColors.primary,
          fontSize: 14,
          decoration: TextDecoration.none),
    ),
  );
}
