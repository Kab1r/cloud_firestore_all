import 'collection.dart';
import '../interface.dart' as intf;
import 'package:cloud_firestore/cloud_firestore.dart' as mobile;

class DocumentSnapshot implements intf.DocumentSnapshot {
  mobile.DocumentSnapshot _documentSnapshot;
  DocumentSnapshot(this._documentSnapshot);

  DocumentReference get ref => DocumentReference(_documentSnapshot.reference);
  String get id => _documentSnapshot.documentID;
  Map<String, dynamic> get data => _documentSnapshot.data;

  operator [](String key) => _documentSnapshot[key];
}

class DocumentReference implements intf.DocumentReference {
  mobile.DocumentReference _documentReference;
  DocumentReference(this._documentReference);

  String get id => _documentReference.documentID;

  Stream<DocumentSnapshot> get onSnapshot => _documentReference
      .snapshots()
      .map((mobile.DocumentSnapshot snap) => DocumentSnapshot(snap));

  CollectionReference get parent =>
      CollectionReference(_documentReference.parent());

  String get path => _documentReference.path;

  CollectionReference collection(String collectionPath) =>
      CollectionReference(_documentReference.collection(collectionPath));

  Future<void> delete() => _documentReference.delete();

  Future<DocumentSnapshot> get() => _documentReference
      .get()
      .then((mobile.DocumentSnapshot snap) => DocumentSnapshot(snap));

  Future<void> set(Map<String, dynamic> data) =>
      _documentReference.setData(data);

  Future<void> update({Map<String, dynamic> data}) =>
      _documentReference.updateData(data);
}
