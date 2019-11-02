import 'document.dart';
import 'firestore.dart';

abstract class Query {
  // Properties
  Firestore get firestore;

  // Methods
  Query endAt(List values, {dynamic snapshot});
  Query endBefore(List values, {dynamic snapshot});
  Future<QuerySnapshot> getDocuments();
  Query limit(int length);
  Query orderBy(dynamic fieldPath, {bool descending: false});
  Stream<QuerySnapshot> get onSnapshot;
  Query startAfter(List values, {DocumentSnapshot snapshot});
  Query startAt(List values, {DocumentSnapshot snapshot});
}

abstract class QuerySnapshot {
  List<DocumentSnapshot> get docs;
}
