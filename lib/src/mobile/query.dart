import 'document.dart';
import 'firestore.dart';

import '../interface.dart' as intf;
import 'package:cloud_firestore/cloud_firestore.dart' as mobile;

class Query implements intf.Query {
  mobile.Query _query;

  Query(this._query);

  // Properties
  @override
  Firestore get firestore => Firestore(_query.firestore);

  // Methods
  @override
  Query endAt(List values, {dynamic snapshot}) => Query(_query.endAt(values));

  @override
  Query endBefore(List values, {dynamic snapshot}) =>
      Query(_query.endBefore(values));

  @override
  Future<QuerySnapshot> getDocuments() => _query
      .getDocuments()
      .then((mobile.QuerySnapshot snap) => QuerySnapshot(snap));

  @override
  Query limit(int length) => Query(_query.limit(length));

  @override
  Query orderBy(dynamic fieldPath, {bool descending: false}) =>
      Query(_query.orderBy(fieldPath, descending: descending));

  @override
  Stream<QuerySnapshot> get onSnapshot => _query
      .snapshots()
      .map((mobile.QuerySnapshot snap) => QuerySnapshot(snap));

  @override
  Query startAfter(List values, {intf.DocumentSnapshot snapshot}) =>
      Query(_query.startAfter(values));

  @override
  Query startAt(List values, {intf.DocumentSnapshot snapshot}) =>
      Query(_query.startAt(values));
}

class QuerySnapshot implements intf.QuerySnapshot {
  mobile.QuerySnapshot _querySnapshot;
  QuerySnapshot(this._querySnapshot);

  @override
  List<DocumentSnapshot> get docs => _querySnapshot.documents
      .map((mobile.DocumentSnapshot snap) => DocumentSnapshot(snap));
}
