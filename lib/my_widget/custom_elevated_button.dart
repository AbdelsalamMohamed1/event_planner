import 'package:event_plannig/my_app_colors.dart';
import 'package:event_plannig/my_theme_data.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  Function onClick;
  String text;
  bool? center;
  Color? borderColor;
  Color? backgroundColor;
  TextStyle? textStyle;
  ImageIcon? imageIcon;

  CustomElevatedButton(
      {required this.onClick,
      required this.text,
      this.center = false,
      this.textStyle,
      this.borderColor,
      this.backgroundColor,
      this.imageIcon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onClick();
      },
      child: Container(
        child: (center!)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  imageIcon ?? SizedBox(),
                  Text(
                    text,
                    style: textStyle ??
                        MyThemeData.lightTheme.textTheme.titleLarge,
                  )
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  imageIcon ?? SizedBox(),
                  Text(
                    text,
                    style: textStyle ??
                        MyThemeData.lightTheme.textTheme.titleLarge,
                  )
                ],
              ),
      ),
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: borderColor ?? MyAppColors.primary)
          ),
        backgroundColor: backgroundColor??MyAppColors.primary,
        elevation: 0
      ),
    );
  }
}
