import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData theme=ThemeData.light();
  void  changeTheme(ThemeData newTheme){
    if(theme==newTheme){return;}
    theme=newTheme;
    notifyListeners();
  }
}