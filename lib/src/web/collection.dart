import 'document.dart';
import 'query.dart';
import '../interface.dart' as intf;
import 'package:firebase/firestore.dart' as web;

class CollectionReference extends Query implements intf.CollectionReference {
  web.CollectionReference _collectionReference;

  CollectionReference(this._collectionReference) : super(_collectionReference);

  @override
  String get id => _collectionReference.id;

  @override
  Future<DocumentReference> add(Map<String, dynamic> data) =>
      _collectionReference
          .add(data)
          .then((web.DocumentReference docRef) => DocumentReference(docRef));

  @override
  DocumentReference document([String path]) =>
      DocumentReference(_collectionReference.doc(path));

  @override
  DocumentReference parent() => DocumentReference(_collectionReference.parent);
}
