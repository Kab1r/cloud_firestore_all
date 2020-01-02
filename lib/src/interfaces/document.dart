import 'collection.dart';

/// A DocumentSnapshot contains data read from a document in your Firestore
/// database.
///
/// The data can be extracted with the data property or by using subscript
/// syntax to access a specific field.
abstract class DocumentSnapshot {
  /// The reference that produced this snapshot
  DocumentReference get ref;

  /// This document's given or generated ID in the collection.
  String get id;

  /// Contains all the data of this snapshot
  Map<String, dynamic> get data;

  /// Reads individual values from the snapshot
  dynamic operator [](String key);
}

/// A [DocumentReference] refers to a document location in a Firestore database
/// and can be used to write, read, or listen to the location.
///
/// The document at the referenced location may or may not exist.
/// A [DocumentReference] can also be used to create a [CollectionReference]
/// to a subcollection.
abstract class DocumentReference {
  /// This document's given or generated ID in the collection.
  String get id;

  /// Notifies of documents at this location
  Stream<DocumentSnapshot> get onSnapshot;

  /// Parent returns the containing [CollectionReference].
  CollectionReference get parent;

  /// Slash-delimited path representing the database location of this query.
  String get path;

  /// Returns the reference of a collection contained inside of this document.
  CollectionReference collection(String pathcollectionPath);

  /// Deletes the document referred to by this [DocumentReference].
  Future<void> delete();

  /// Reads the document referenced by this [DocumentReference].
  ///
  /// If no document exists, the read will return null.
  Future<DocumentSnapshot> get();

  /// Writes to the document referred to by this [DocumentReference].
  ///
  /// If the document does not yet exist, it will be created.
  Future<void> set(Map<String, dynamic> data);

  /// Updates fields in the document referred to by this [DocumentReference].
  ///
  /// Values in [data] may be of any supported Firestore type as well as
  /// special sentinel [FieldValue] type.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({Map<String, dynamic> data});
}
