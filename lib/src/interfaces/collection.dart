import 'document.dart';
import 'query.dart';

/// A CollectionReference object can be used for adding documents, getting
/// document references, and querying for documents (using the methods
/// inherited from [Query]).
abstract class CollectionReference extends Query {
  /// ID of the referenced collection.
  String get id;

  /// Returns a [DocumentReference] with an auto-genereated ID, after populating it with the provided [data].
  Future<DocumentReference> add(Map<String, dynamic> data);

  /// Returns a [DocumentReference] with the provided path.
  DocumentReference document([String path]);

  /// For subcollections, parent returns the containing [DocumentReference].
  ///
  /// For root collections, null is returned.
  DocumentReference parent();
}
