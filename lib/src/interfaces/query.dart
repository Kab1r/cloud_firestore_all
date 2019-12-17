import 'document.dart';
import 'firestore.dart';

/// A Query refers to a Query which you can read or listen to.
/// You can also construct refined [Query] objects by adding filters
/// and ordering.
abstract class Query {
  /// The [Firestore] instance associated with this query
  Firestore get firestore;

  /// Creates a new [Query] where the results end at the provided document
  /// (inclusive). The end position is relative to the order of the query.
  /// The document must contain all of the fields provided in the orderBy
  /// of this query.
  ///
  /// The [DocumentSnapshot] parameter is the snapshot of the document you want
  /// the query to end at. Or the list of [fieldValues] to
  /// end this query at, in order of the query's order by.
  ///
  /// Returns non-null created [Query].
  Query endAt(List values, {dynamic snapshot});

  /// Creates a new [Query] where the results end before the provided document
  /// (exclusive). The end position is relative to the order of the query.
  /// The document must contain all of the fields provided in the orderBy of
  /// this query.
  ///
  /// The [DocumentSnapshot] parameter is the snapshot of the document you want
  /// the query to end before. Or the list of [fieldValues] to
  /// end this query before, in order of the query's order by.
  ///
  /// Returns non-null created [Query].
  Query endBefore(List values, {dynamic snapshot});

  /// Executes the query and returns the results as a [QuerySnapshot].
  ///
  /// Returns non-null [Future] that will be resolved with the results of the
  /// query.
  Future<QuerySnapshot> getDocuments();

  /// Creates a new [Query] where the results are limited to the specified
  /// number of documents.
  ///
  /// The [limit] parameter is the maximum number of items to return.
  ///
  /// Returns non-null created [Query].
  Query limit(int length);

  /// Creates a new [Query] where the results are sorted by the specified field,
  /// in descending or ascending order.
  ///
  /// The [fieldPath] parameter is a String or `FieldPath` to sort by.
  ///
  /// The optional [directionStr] parameter is a direction to sort by
  /// ([:asc:] or [:desc:]). If not specified, the default order is ascending.
  ///
  /// Returns non-null created [Query].
  Query orderBy(dynamic fieldPath, {bool descending: false});

  /// Attaches a listener for [QuerySnapshot] events.
  Stream<QuerySnapshot> get onSnapshot;

  /// Creates a new [Query] where the results start after the provided document
  /// (exclusive). The starting position is relative to the order of the query.
  /// The document must contain all of the fields provided in the
  /// [orderBy] of this query.
  ///
  /// The [DocumentSnapshot] parameter is the snapshot of the document you want
  /// the query to start after. Or the list of [fieldValues] to
  /// start this query after, in order of the query's order by.
  ///
  /// Returns non-null created [Query].
  Query startAfter(List values, {DocumentSnapshot snapshot});

  /// Creates a new [Query] where the results start at the provided document
  /// (inclusive). The starting position is relative to the order of the query.
  /// The document must contain all of the fields provided in the orderBy of
  /// the query.
  ///
  /// The [DocumentSnapshot] parameter is the snapshot of the document you want
  /// the query to start at. Or the list of [fieldValues] to
  /// start this query at, in order of the query's order by.
  ///
  /// Returns non-null created [Query].
  Query startAt(List values, {DocumentSnapshot snapshot});

  /// Creates a new [Query] that returns only documents that include the
  /// specified fields and where the values satisfy the constraints provided.
  ///
  /// The [fieldPath] parameter is a String or non-null `FieldPath` to compare.
  ///
  /// The [opStr] parameter is the operation string
  /// (e.g [:<:], [:<=:], [:==:], [:>:], [:>=:]).
  ///
  /// The [value] parameter is the value for comparison.
  ///
  /// Returns non-null created [Query].
  Query where(
    dynamic field, {
    dynamic isEqualTo,
    dynamic isLessThan,
    dynamic isLessThanOrEqualTo,
    dynamic isGreaterThan,
    dynamic isGreaterThanOrEqualTo,
    dynamic arrayContains,
    List<dynamic> arrayContainsAny,
    List<dynamic> whereIn,
    bool isNull,
  });
}

/// A [QuerySnapshot] contains zero or more [DocumentSnapshot] objects
/// representing the results of a query. The documents can be accessed as
/// an array via the docs property or enumerated using the [forEach()] method.
/// The number of documents can be determined via the [empty] and [size] properties.
abstract class QuerySnapshot {
  /// Non-null list of all the documents.
  List<DocumentSnapshot> get docs;
}
