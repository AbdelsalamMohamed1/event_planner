import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  Color borderColor;
  Icon? prefix;
  Icon? suffix;
  String hintText;
  TextStyle? hintStyle;
  String label;
  TextStyle? labelStyle;
  
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(),
    );
  }
}
