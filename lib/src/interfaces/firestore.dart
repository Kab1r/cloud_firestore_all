import 'collection.dart';
import 'document.dart';

/// The entry point for accessing a Firestore.
abstract class Firestore {
  /// Gets a [CollectionReference] for the specified Firestore path.
  CollectionReference collection(String path);

  /// Gets a [DocumentReference] for the specified Firestore path.
  DocumentReference document(String path);
}
