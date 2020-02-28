import 'collection.dart';
import '../interface.dart' as intf;
import 'package:cloud_firestore/cloud_firestore.dart' as mobile;

class DocumentSnapshot implements intf.DocumentSnapshot {
  mobile.DocumentSnapshot _documentSnapshot;
  DocumentSnapshot(this._documentSnapshot);

  DocumentReference get ref => DocumentReference(_documentSnapshot.reference);
  String get id => _documentSnapshot.documentID;
  Map<String, dynamic> get data => _documentSnapshot.data;
  bool get exists => data != null;

  operator [](String key) => _documentSnapshot[key];
}

class DocumentReference implements intf.DocumentReference {
  mobile.DocumentReference documentReference;
  DocumentReference(this.documentReference);

  String get id => documentReference.documentID;

  Stream<DocumentSnapshot> get onSnapshot => documentReference
      .snapshots()
      .map((mobile.DocumentSnapshot snap) => DocumentSnapshot(snap));

  CollectionReference get parent =>
      CollectionReference(documentReference.parent());

  String get path => documentReference.path;

  CollectionReference collection(String collectionPath) =>
      CollectionReference(documentReference.collection(collectionPath));

  Future<void> delete() => documentReference.delete();

  Future<DocumentSnapshot> get() => documentReference
      .get()
      .then((mobile.DocumentSnapshot snap) => DocumentSnapshot(snap));

  Future<void> set(Map<String, dynamic> data) =>
      documentReference.setData(data);

  Future<void> update({Map<String, dynamic> data}) =>
      documentReference.updateData(data);
}
