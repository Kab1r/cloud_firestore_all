import 'document.dart';
import '../interface.dart' as intf;
import 'package:cloud_firestore/cloud_firestore.dart' as mobile;

class WriteBatch implements intf.WriteBatch {
  mobile.WriteBatch _writeBatch;

  WriteBatch(this._writeBatch);

  @override
  Future<void> commit() => _writeBatch.commit();

  @override
  void delete(intf.DocumentReference document) =>
      _writeBatch.delete((document as DocumentReference).documentReference);

  @override
  void set(intf.DocumentReference document, Map<String, dynamic> data,
          {bool merge = false}) =>
      _writeBatch.setData(
          (document as DocumentReference).documentReference, data);

  @override
  void update(intf.DocumentReference document, Map<String, dynamic> data) =>
      _writeBatch.updateData(
          (document as DocumentReference).documentReference, data);
}
