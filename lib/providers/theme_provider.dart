import 'package:event_plannig/my_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData theme = MyThemeData.lightTheme;
  ThemeProvider(){
    loadTheme();
  }

  void changeTheme(ThemeData newTheme) {
    if (theme == newTheme) {
      return;
    }
    theme=newTheme;
    saveTheme(theme);
    notifyListeners();
  }
  void saveTheme(ThemeData theme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    (theme == MyThemeData.lightTheme)
        ? await prefs.setBool('lightTheme', true)
        : await prefs.setBool('lightTheme', false);
  }
  void loadTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('lightTheme')!){
      theme= await MyThemeData.lightTheme;
    }else{theme =await MyThemeData.darkTheme;}
  }
}