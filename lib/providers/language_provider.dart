import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  String language='ar';
  LanguageProvider(){
    loadLanguage();
  }
  void changeLanguage(String newLanguage){
    if(language==newLanguage){return;}
    language=newLanguage;
    saveLanguage(language);
    notifyListeners();
  }
  void saveLanguage(String language) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', language);
  }

  Future<void> loadLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    language= prefs.getString('language')??'ar';
  }
}
