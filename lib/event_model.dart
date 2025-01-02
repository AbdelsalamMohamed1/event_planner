import 'package:flutter/material.dart';

class EventModel {
  String title;
  String decs;
  bool isfavorite;
  String date;
  String time;

  EventModel(
      {required this.title,
      required this.decs,
      required this.date,
      required this.isfavorite,
      required this.time});

  static List<String> lightThemeImages = [
    'assets/images/light_birthday.png',
    'assets/images/light_bookClub.png',
    'assets/images/light_eating.png',
    'assets/images/light_exhibition.png',
    'assets/images/light_gaming.png',
    'assets/images/light_holiday.png',
    'assets/images/light_meeting.png',
    'assets/images/light_sports.png',
    'assets/images/light_workshop.png',
  ];
  static List<String> darkThemeImages = [
    'assets/images/dark_birthday.png',
    'assets/images/dark_bookClub.png',
    'assets/images/dark_eating.png',
    'assets/images/dark_exhibition.png',
    'assets/images/dark_gaming.png',
    'assets/images/dark_holiday.png',
    'assets/images/dark_meeting.png',
    'assets/images/dark_sports.png',
    'assets/images/dark_workshop.png',
  ];
}
