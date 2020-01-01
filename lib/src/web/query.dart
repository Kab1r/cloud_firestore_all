import 'document.dart';
import 'firestore.dart';

import '../interface.dart' as intf;
import 'package:firebase/firestore.dart' as web;

class Query implements intf.Query {
  web.Query _query;

  Query(this._query);
  Query.empty();

  // Properties
  @override
  Firestore get firestore => Firestore(_query.firestore);

  // Methods
  @override
  Query endAt(List values, {dynamic snapshot}) => Query(_query.endAt(
      snapshot: (snapshot as DocumentSnapshot).documentSnapshot,
      fieldValues: values));

  @override
  Query endBefore(List values, {dynamic snapshot}) =>
      Query(_query.endBefore(snapshot: snapshot, fieldValues: values));

  @override
  Future<QuerySnapshot> getDocuments() =>
      _query.get().then((web.QuerySnapshot snap) => QuerySnapshot(snap));

  @override
  Query limit(int length) => Query(_query.limit(length));

  @override
  Query orderBy(dynamic fieldPath, {bool descending: false}) =>
      Query(_query.orderBy(
          fieldPath, descending == null ? null : descending ? 'desc' : 'asc'));

  @override
  Stream<QuerySnapshot> get onSnapshot =>
      _query.onSnapshot.map((web.QuerySnapshot snap) => QuerySnapshot(snap));

  @override
  Query startAfter(List values, {intf.DocumentSnapshot snapshot}) =>
      Query(_query.startAfter(
          snapshot: (snapshot as DocumentSnapshot).documentSnapshot,
          fieldValues: values));

  @override
  Query startAt(List values, {intf.DocumentSnapshot snapshot}) =>
      Query(_query.startAt(
          snapshot: (snapshot as DocumentSnapshot).documentSnapshot,
          fieldValues: values));

  @override
  intf.Query where(field,
      {isEqualTo,
      isLessThan,
      isLessThanOrEqualTo,
      isGreaterThan,
      isGreaterThanOrEqualTo,
      arrayContains,
      List arrayContainsAny,
      List whereIn,
      bool isNull = false}) {
    /// https://firebase.google.com/docs/reference/js/firebase.firestore.html#wherefilterop
    String op;
    dynamic value;

    if (isEqualTo != null) {
      op = '==';
      value = isEqualTo;
    }
    if (isLessThan != null) {
      op = '<';
      value = isLessThan;
    }
    if (isLessThanOrEqualTo != null) {
      op = '<=';
      value = isLessThanOrEqualTo;
    }
    if (isGreaterThan != null) {
      op = '>';
      value = isGreaterThan;
    }
    if (isGreaterThanOrEqualTo != null) {
      op = '>=';
      value = isGreaterThanOrEqualTo;
    }
    if (arrayContains != null) {
      op = 'array-contains';
      value = arrayContains;
    }
    if (arrayContainsAny != null) {
      op = 'array-contains-any';
      value = arrayContainsAny;
    }
    if (whereIn != null) {
      op = 'in';
      value = whereIn;
    }
    if (isNull) {
      op = '==';
      value = null;
    }

    return Query(_query.where(field, op, value));
  }
}

class QuerySnapshot implements intf.QuerySnapshot {
  web.QuerySnapshot _querySnapshot;
  QuerySnapshot(this._querySnapshot);

  @override
  List<DocumentSnapshot> get docs => _querySnapshot.docs
      .map((web.DocumentSnapshot snap) => DocumentSnapshot(snap))
      .toList();
}
