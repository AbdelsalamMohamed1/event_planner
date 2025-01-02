import 'package:event_plannig/my_app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  TextStyle hintStyle;
  Color borderColor;
  String hintText;
  ImageIcon? prefix;
  ImageIcon? suffix;
  int? maxLines;
  String? Function(String?)? validator;
  void Function(String)? onChanged;


  CustomTextFormField({
    required this.hintText,
    required this.hintStyle,
    required this.borderColor,
    this.prefix,
    this.suffix,
    this.maxLines,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:onChanged,
      validator: validator,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: MyAppColors.red)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: borderColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: borderColor)),
        hintText: hintText,
        hintStyle: hintStyle,
        prefixIcon: prefix,
        suffixIcon: suffix,

      ),
    );
  }
}
