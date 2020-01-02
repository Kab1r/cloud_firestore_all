import 'document.dart';
import '../interface.dart' as intf;
import 'package:firebase/firestore.dart' as web;

class WriteBatch implements intf.WriteBatch {
  web.WriteBatch _writeBatch;

  WriteBatch(this._writeBatch);

  @override
  Future<void> commit() => _writeBatch.commit();

  @override
  void delete(intf.DocumentReference document) =>
      _writeBatch.delete((document as DocumentReference).documentReference);

  @override
  void set(intf.DocumentReference document, Map<String, dynamic> data,
          {bool merge = false}) =>
      _writeBatch.set((document as DocumentReference).documentReference, data);

  @override
  void update(intf.DocumentReference document, Map<String, dynamic> data) =>
      _writeBatch.update((document as DocumentReference).documentReference,
          data: data);
}
