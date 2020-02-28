import 'collection.dart';
import '../interface.dart' as intf;
import 'package:firebase/firestore.dart' as web;

class DocumentSnapshot implements intf.DocumentSnapshot {
  web.DocumentSnapshot documentSnapshot;
  DocumentSnapshot(this.documentSnapshot);

  @override
  DocumentReference get ref => DocumentReference(documentSnapshot.ref);

  @override
  String get id => documentSnapshot.id;

  @override
  Map<String, dynamic> get data => documentSnapshot.data();

  @override
  bool get exists => data != null;

  @override
  operator [](String key) => documentSnapshot.get(key);
}

class DocumentReference implements intf.DocumentReference {
  web.DocumentReference documentReference;
  DocumentReference(this.documentReference);

  @override
  String get id => documentReference.id;

  @override
  Stream<DocumentSnapshot> get onSnapshot => documentReference.onSnapshot
      .map((web.DocumentSnapshot snap) => DocumentSnapshot(snap));

  @override
  CollectionReference get parent =>
      CollectionReference(documentReference.parent);

  @override
  String get path => documentReference.path;

  @override
  CollectionReference collection(String collectionPath) =>
      CollectionReference(documentReference.collection(collectionPath));

  @override
  Future<void> delete() => documentReference.delete();

  @override
  Future<DocumentSnapshot> get() => documentReference
      .get()
      .then((web.DocumentSnapshot snap) => DocumentSnapshot(snap));

  @override
  Future<void> set(Map<String, dynamic> data) => documentReference.set(data);

  @override
  Future<void> update({Map<String, dynamic> data}) =>
      documentReference.update(data: data);
}
