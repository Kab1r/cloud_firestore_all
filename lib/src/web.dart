import 'package:firebase/firestore.dart' as firestore;
import 'package:firebase/firebase.dart' as firebase;

import 'interface.dart' as i;

void initializeApp(
    [String apiKey,
    String authDomain,
    String databaseURL,
    String projectId,
    String storageBucket]) {}

class Firestore implements i.Firestore {
  firestore.Firestore _firestore;

  Firestore._(this._firestore);

  Firestore() {
    this._firestore = firebase.firestore();
  }

  @override
  CollectionReference collection(String path) =>
      CollectionReference._(this._firestore.collection(path));
}

class CollectionReference implements i.CollectionReference {
  firestore.CollectionReference _collectionReference;

  CollectionReference._(this._collectionReference);

  @override
  DocumentReference doc([String path]) =>
      DocumentReference._(this._collectionReference.doc(path));

  @override
  String get id => this._collectionReference.id;

  @override
  Stream<QuerySnapshot> get onSnapshot => this
      ._collectionReference
      .onSnapshot
      .map((firestore.QuerySnapshot querySnapshot) =>
          QuerySnapshot._(querySnapshot));

  @override
  String get path => this._collectionReference.path;
}

class DocumentReference extends i.DocumentReference {
  firestore.DocumentReference _documentReference;
  DocumentReference._(this._documentReference);
  @override
  Future<void> delete() => this._documentReference.delete();

  @override
  Future<i.DocumentSnapshot> get() => this
      ._documentReference
      .get()
      .asStream()
      .map((firestore.DocumentSnapshot documentSnapshot) =>
          DocumentSnapshot._(documentSnapshot))
      .first;

  @override
  String get id => this._documentReference.id;

  @override
  Stream<DocumentSnapshot> get onSnapshot => this
      ._documentReference
      .onSnapshot
      .map((firestore.DocumentSnapshot documentSnapshot) =>
          DocumentSnapshot._(documentSnapshot));

  @override
  CollectionReference get parent =>
      CollectionReference._(this._documentReference.parent);

  @override
  String get path => this._documentReference.path;

  @override
  Future<void> set(Map<String, dynamic> data) =>
      this._documentReference.set(data);

  @override
  Future<void> update({Map<String, dynamic> data}) =>
      this._documentReference.update(data: data);
}

class QuerySnapshot implements i.QuerySnapshot {
  firestore.QuerySnapshot _querySnapshot;
  QuerySnapshot._(this._querySnapshot);

  @override
  List<DocumentSnapshot> get docs =>
      _querySnapshot.docs.map((firestore.DocumentSnapshot documentSnapshot) =>
          DocumentSnapshot._(documentSnapshot));
}

class DocumentSnapshot implements i.DocumentSnapshot {
  firestore.DocumentSnapshot _documentSnapshot;
  DocumentSnapshot._(this._documentSnapshot);
  @override
  String get id => this._documentSnapshot.id;

  @override
  DocumentReference get ref => DocumentReference._(this._documentSnapshot.ref);

  @override
  Map<String, dynamic> get data => this._documentSnapshot.data();
}
