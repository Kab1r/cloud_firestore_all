import 'document.dart';
import 'query.dart';
import '../interface.dart' as intf;
import 'package:firebase/firestore.dart' as web;

class CollectionReference extends Query implements intf.CollectionReference {
  web.CollectionReference _collectionReference;

  CollectionReference(this._collectionReference) : super(_collectionReference);

  String get id => _collectionReference.id;

  Future<DocumentReference> add(Map<String, dynamic> data) =>
      _collectionReference
          .add(data)
          .then((web.DocumentReference docRef) => DocumentReference(docRef));
  DocumentReference document([String path]) =>
      DocumentReference(_collectionReference.doc(path));
  DocumentReference parent() => DocumentReference(_collectionReference.parent);
}
