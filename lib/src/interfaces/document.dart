import 'collection.dart';

abstract class DocumentSnapshot {
  DocumentReference get ref;
  String get id;
  Map<String, dynamic> get data;

  dynamic operator [](String key);
}

abstract class DocumentReference {
  String get id;
  Stream<DocumentSnapshot> get onSnapshot;
  CollectionReference get parent;
  String get path;

  Future<void> delete();
  Future<DocumentSnapshot> get();
  Future<void> set(Map<String, dynamic> data);
  Future<void> update({Map<String, dynamic> data});
}
