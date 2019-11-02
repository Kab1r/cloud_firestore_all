import 'document.dart';
import 'query.dart';

abstract class CollectionReference extends Query {
  String get id;

  Future<DocumentReference> add(Map<String, dynamic> data);
  DocumentReference document([String path]);
  DocumentReference parent();
}
