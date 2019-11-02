import 'document.dart';
import 'query.dart';
import '../interface.dart' as intf;
import 'package:cloud_firestore/cloud_firestore.dart' as mobile;

class CollectionReference extends Query implements intf.CollectionReference {
  mobile.CollectionReference _collectionReference;

  CollectionReference(this._collectionReference) : super(_collectionReference);

  String get id => _collectionReference.id;

  Future<DocumentReference> add(Map<String, dynamic> data) =>
      _collectionReference
          .add(data)
          .then((mobile.DocumentReference docRef) => DocumentReference(docRef));
  DocumentReference document([String path]) =>
      DocumentReference(_collectionReference.document(path));
  DocumentReference parent() =>
      DocumentReference(_collectionReference.parent());
}
