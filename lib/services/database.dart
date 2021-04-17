import 'package:brew_crew/models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // Collection Reference

  final CollectionReference brewCollection =
      Firestore.instance.collection('brews');

  Future updateUserDate(String sugars, String name, int strength) async {
    return await brewCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  //convert Query Snapshot to Bre List
  List<Brew> _brewListfromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brew(
        name: doc.data['name'] ?? "",
        sugars: doc.data['sugars'] ?? "0",
        strength: doc.data['strength'] ?? 0,
      );
    }).toList();
  }

  // Brews Stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListfromSnapshot);
  }
}
