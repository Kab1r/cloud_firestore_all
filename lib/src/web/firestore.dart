import 'collection.dart';
import 'document.dart';

import '../interface.dart' as intf;
import 'package:firebase/firestore.dart' as web;

class Firestore implements intf.Firestore {
  web.Firestore _firestore;
  Firestore(this._firestore);

  @override
  CollectionReference collection(String path) =>
      CollectionReference(_firestore.collection(path));

  @override
  DocumentReference document(String path) =>
      DocumentReference(_firestore.doc(path));
}
