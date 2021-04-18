import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // Collection Reference

  final CollectionReference brewCollection =
      Firestore.instance.collection('brews');

  Future updateUserDate(String name, String sugars, int strength) async {
    return await brewCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  //convert Query Snapshot to Brew List
  List<Brew> _brewListfromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brew(
        name: doc.data['name'] ?? "",
        sugars: doc.data['sugars'] ?? "0",
        strength: doc.data['strength'] ?? 0,
      );
    }).toList();
  }

  //convert Document Snapshot to User Data
  UserData _userDataFromDocumentSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      strength: snapshot.data['strength'],
      sugars: snapshot.data['sugars'],
      name: snapshot.data['name'],
    );
  }

  // Brews Stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListfromSnapshot);
  }

  // User Data Stream

  Stream<UserData> get userData {
    return brewCollection
        .document(uid)
        .snapshots()
        .map(_userDataFromDocumentSnapshot);
  }
}
