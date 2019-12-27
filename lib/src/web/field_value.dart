import '../interface.dart' as intf;
import 'package:firebase/firestore.dart' as web;

class FieldValue implements intf.FieldValue {
  static dynamic arrayRemove(List elements) => web.FieldValue.arrayRemove(elements);
  static dynamic arrayUnion(List elements) => web.FieldValue.arrayUnion(elements);
  static dynamic delete() => web.FieldValue.delete();
  static dynamic increment(num value) => web.FieldValue.increment(value);
  static dynamic serverTimestamp() => web.FieldValue.serverTimestamp();
}

class FieldPath implements intf.FieldPath {
  static dynamic documentId() => web.FieldPath.documentId;
}
