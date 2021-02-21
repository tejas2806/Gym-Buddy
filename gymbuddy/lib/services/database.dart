import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gymbuddy/models/person.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  //collection ref
  final CollectionReference personData = FirebaseFirestore.instance.collection('person');

  Future updateUserData(double latitude, double longitude, String name,int set, int reps, int calories) async {
    return await personData.doc(uid).set({
      'latitude': latitude,
      'longitude': longitude,
      'name': name,
      'set': set,
      'reps': reps,
      'calories': calories
    });
  }

  //brew list from snapshot
  List<Person> _personfromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      return Person(
        latitude: doc.data()['latitude'] ?? 0,
        longitude: doc.data()['longitude'] ?? 0,
        name: doc.data()['name'] ?? '',
        set: doc.data()['set'] ?? 0,
        reps: doc.data()['reps'] ?? 0,
        calories: doc.data()['calories'] ?? 0
      );
    }).toList();
  }

  //get brews stream
  Stream<List<Person>> get person {
    return personData.snapshots()
        .map(_personfromSnapshot);
  }

}