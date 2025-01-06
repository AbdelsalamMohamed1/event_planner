import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_plannig/event_model.dart';

class FireBaseUtils {
  static CollectionReference<EventModel> getEventCollection(){
   return FirebaseFirestore.instance
       .collection(EventModel.collectionName)
       .withConverter<EventModel>(
     fromFirestore: (snapshot, options) =>
         EventModel.fromFireStore(snapshot.data()),
     toFirestore: (event, _) => event.toFireStore(),);
  }
  static Future<void> addEventToFireStore(EventModel event) {
    var collection= getEventCollection();
    var docRef= collection.doc();
    event.id=docRef.id;
    return docRef.set(event);
  }
  static Future<void> updateEvent (EventModel event) async {
    getEventCollection().doc(event.id).update(event.toFireStore());
  }
  static Future<void> deleteEvent(EventModel event) async{
    getEventCollection().doc(event.id).delete();
  }
  static Future<void> changeFavorite (EventModel event) async {
    bool isFavorite=event.isFavorite;
    getEventCollection().doc(event.id).update({'favorite':!isFavorite});
  }
  }


