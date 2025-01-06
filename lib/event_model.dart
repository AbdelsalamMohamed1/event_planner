import 'package:flutter/material.dart';

class EventModel {
  static const String collectionName='collection';
  String title;
  String desc;
  String type;
  bool isFavorite;
  DateTime date;
  String time;
  int image;
  String id;

  EventModel(
      {this.id = '',
      required this.title,
      required this.desc,
      required this.type,
      required this.date,
      this.isFavorite = false,
      required this.time,
      required this.image});
  EventModel.fromFireStore(Map<String,dynamic>? data):this(
    id: data!['id'] as String,
      type: data['type'] as String,
      title: data['title'] as String,
    desc: data['desc'] as String,
    image: data['image'] as int,
    date:DateTime.fromMillisecondsSinceEpoch(data['date']) ,
    time: data['time'] as String,
    isFavorite: data['favorite'] as bool,
  );

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
   Map<String,dynamic> toFireStore(){
    return {
      'id':id,
      'title':title,
      'desc':desc,
      'type':type,
      'favorite':isFavorite,
      'time':time,
      'date':date.millisecondsSinceEpoch,
      'image':image,
    };
  }

}
