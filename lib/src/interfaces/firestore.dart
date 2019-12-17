import 'collection.dart';
import 'document.dart';
import 'firebase_app.dart';

/// The entry point for accessing a Firestore.
abstract class Firestore {
  /// The [FirebaseApp] instance to which this [FirebaseDatabase] belongs.
  ///
  /// If null, the default [FirebaseApp] is used.
  FirebaseApp get app;

  /// Gets a [CollectionReference] for the specified Firestore path.
  CollectionReference collection(String path);

  /// Gets a [DocumentReference] for the specified Firestore path.
  DocumentReference document(String path);
}
