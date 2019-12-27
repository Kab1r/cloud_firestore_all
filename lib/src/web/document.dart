import 'collection.dart';
import '../interface.dart' as intf;
import 'package:firebase/firestore.dart' as web;

class DocumentSnapshot implements intf.DocumentSnapshot {
  web.DocumentSnapshot documentSnapshot;
  DocumentSnapshot(this.documentSnapshot);

  DocumentReference get ref => DocumentReference(documentSnapshot.ref);
  String get id => documentSnapshot.id;
  Map<String, dynamic> get data => documentSnapshot.data();

  operator [](String key) => documentSnapshot.get(key);
}

class DocumentReference implements intf.DocumentReference {
  web.DocumentReference _documentReference;
  DocumentReference(this._documentReference);

  String get id => _documentReference.id;

  Stream<DocumentSnapshot> get onSnapshot => _documentReference.onSnapshot
      .map((web.DocumentSnapshot snap) => DocumentSnapshot(snap));

  CollectionReference get parent =>
      CollectionReference(_documentReference.parent);

  String get path => _documentReference.path;

  CollectionReference collection(String collectionPath) =>
      CollectionReference(_documentReference.collection(collectionPath));

  Future<void> delete() => _documentReference.delete();

  Future<DocumentSnapshot> get() => _documentReference
      .get()
      .then((web.DocumentSnapshot snap) => DocumentSnapshot(snap));

  Future<void> set(Map<String, dynamic> data) => _documentReference.set(data);

  Future<void> update({Map<String, dynamic> data}) =>
      _documentReference.update(data: data);
}
