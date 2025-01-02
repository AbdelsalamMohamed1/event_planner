import 'package:event_plannig/my_app_colors.dart';
import 'package:event_plannig/my_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryTab extends StatelessWidget {
  bool isSelected;
  String title;
  ImageIcon? imageIcon;
  Color backgroundColor;
  TextStyle textStyle;
  bool createEvent;
  bool? isLightTheme;

  CategoryTab({required this.textStyle,
    required this.isSelected,
    required this.title,
    required this.backgroundColor,
    this.createEvent = false,
    this.isLightTheme,
    this.imageIcon});

  @override
  Widget build(BuildContext context) {
    return (!createEvent)
        ? Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(46),
          color: (isSelected) ? backgroundColor : Colors.transparent,
          border: Border.all(color: backgroundColor)),
      child: (imageIcon != null)
          ? Row(
        children: [
          imageIcon!,
          SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: textStyle,
          )
        ],
      )
          : Row(
        children: [
          Text(
            title,
            style: (isSelected)
                ? textStyle
                : MyThemeData.lightTheme.textTheme.bodyMedium,
          )
        ],
      ),
    )
        : Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(46),
          color: (isSelected) ? backgroundColor : Colors.transparent,
          border: Border.all(color: backgroundColor)),
      child: (imageIcon != null)
          ? Row(
        children: [
          imageIcon!,
          SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: (isSelected)
                ? GoogleFonts.inter(
              color:(isLightTheme!)?MyAppColors.white:MyAppColors.darktheme,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            )
                : GoogleFonts.inter(
                color:backgroundColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
          )
          )],
      )
          : Row(
        children: [
          Text(
            title,
            style: (isSelected)
                ? GoogleFonts.inter(
              color:(isLightTheme!)?MyAppColors.white:MyAppColors.darktheme,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            )
                :  GoogleFonts.inter(
              color:backgroundColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            )
          )
        ],
      ),
    );
  }
}
