import 'package:event_plannig/event_model.dart';
import 'package:flutter/material.dart';

import '../firebase utils/fire_base_utils.dart';

class EventListProvider extends ChangeNotifier {
List<EventModel> eventList=[];
Future<void> getAllEvents({required Function onClick}) async {
  var QuerySnapshot= await FireBaseUtils.getEventCollection().get();
  eventList= QuerySnapshot.docs.map((docs) {
    return docs.data();
  },).toList();
  onClick();
}
Future<void> getAllEventsFiltered({String search='',required Function onClick}) async {
  var QuerySnapshot= await FireBaseUtils.getEventCollection().where('type',isEqualTo: search).get();
  eventList= QuerySnapshot.docs.map((docs) {
    return docs.data();
  },).toList();
  onClick();
}
Future<void> getAllLikedEvents({required Function onClick}) async {
  var QuerySnapshot= await FireBaseUtils.getEventCollection().where('favorite',isEqualTo: true).get();
  eventList= QuerySnapshot.docs.map((docs) {
    return docs.data();
  },).toList();
  onClick();
}
@override
notifyListeners();
}