import '../interface.dart' as intf;
import 'package:cloud_firestore/cloud_firestore.dart' as mobile;

class FieldValue implements intf.FieldValue {
  static dynamic arrayRemove(List elements) =>
      mobile.FieldValue.arrayRemove(elements);
  static dynamic arrayUnion(List elements) =>
      mobile.FieldValue.arrayUnion(elements);
  static dynamic delete() => mobile.FieldValue.delete();
  static dynamic increment(num value) => mobile.FieldValue.increment(value);
  static dynamic serverTimestamp() => mobile.FieldValue.serverTimestamp();
}

class FieldPath implements intf.FieldPath {
  static dynamic documentId() => mobile.FieldPath.documentId;
}
