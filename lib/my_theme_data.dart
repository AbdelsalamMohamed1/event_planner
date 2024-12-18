import 'package:event_plannig/my_app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
        color: MyAppColors.primary,
        iconTheme: IconThemeData(color: MyAppColors.primary)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            padding: EdgeInsets.symmetric(vertical: 16))),
    bottomAppBarTheme: BottomAppBarTheme(
      padding: EdgeInsets.symmetric(vertical: 8),
      color: MyAppColors.primary,
    ),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.inter(
          color: MyAppColors.primary,
          fontWeight: FontWeight.w700,
          fontSize: 20),
      titleLarge: GoogleFonts.inter(
          color: MyAppColors.white, fontWeight: FontWeight.w700, fontSize: 24),
      titleMedium: GoogleFonts.inter(
          color: MyAppColors.black, fontWeight: FontWeight.w700, fontSize: 20),
      bodySmall: GoogleFonts.inter(
          fontWeight: FontWeight.w500, color: MyAppColors.black, fontSize: 16),
      bodyMedium: GoogleFonts.inter(
          fontWeight: FontWeight.w500, color: MyAppColors.white, fontSize: 16),
      bodyLarge: GoogleFonts.inter(
          fontWeight: FontWeight.w500, color: MyAppColors.gray, fontSize: 14),
      displayLarge: GoogleFonts.inter(
          fontWeight: FontWeight.w400, color: MyAppColors.white, fontSize: 14),
      displayMedium: GoogleFonts.inter(
          fontWeight: FontWeight.w700, color: MyAppColors.black, fontSize: 14),
      displaySmall: GoogleFonts.inter(
          fontWeight: FontWeight.w700,
          color: MyAppColors.primary,
          fontSize: 14),
    ),
  );
 static ThemeData darkTheme = ThemeData(
   bottomSheetTheme: BottomSheetThemeData(backgroundColor: MyAppColors.darktheme),
      scaffoldBackgroundColor: MyAppColors.darktheme,
      appBarTheme: AppBarTheme(
          color: MyAppColors.darktheme,
          iconTheme: IconThemeData(color: MyAppColors.primary)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: MyAppColors.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              padding: EdgeInsets.symmetric(vertical: 16))),
      bottomAppBarTheme: BottomAppBarTheme(
        padding: EdgeInsets.symmetric(vertical: 8),
        color: MyAppColors.darktheme,
      ),
      textTheme: TextTheme(
      titleSmall: GoogleFonts.inter(
          color: MyAppColors.primary,
          fontWeight: FontWeight.w700,
          fontSize: 20),
      titleLarge: GoogleFonts.inter(
          color: MyAppColors.white, fontWeight: FontWeight.w700, fontSize: 24),
        titleMedium: GoogleFonts.inter(
            color: MyAppColors.white, fontWeight: FontWeight.w700, fontSize: 20),
      bodySmall: GoogleFonts.inter(
          fontWeight: FontWeight.w500, color: MyAppColors.white, fontSize: 16),
      bodyMedium: GoogleFonts.inter(
          fontWeight: FontWeight.w500, color: MyAppColors.white, fontSize: 16),
      bodyLarge: GoogleFonts.inter(
          fontWeight: FontWeight.w500, color: MyAppColors.white, fontSize: 14),
      displayLarge: GoogleFonts.inter(
          fontWeight: FontWeight.w400, color: MyAppColors.white, fontSize: 14),
      displayMedium: GoogleFonts.inter(
          fontWeight: FontWeight.w700, color: MyAppColors.white, fontSize: 14),
      displaySmall: GoogleFonts.inter(
          fontWeight: FontWeight.w700,
          color: MyAppColors.primary,
          fontSize: 14),
    ),
  );
}
