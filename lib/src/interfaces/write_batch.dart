import 'document.dart';

/// A write batch, used to perform multiple writes as a single atomic unit.
abstract class WriteBatch {
  /// Commits all of the writes in this write batch as a single atomic unit.
  ///
  /// Calling this method prevents any future operations from being added.
  Future<void> commit();

  /// Deletes the document referred to by [document].
  void delete(DocumentReference document);

  /// Writes to the document referred to by [document].
  ///
  /// If the document does not yet exist, it will be created.
  /// If [merge] is true, the provided data will be merged into an existing document instead of overwriting.
  void set(DocumentReference document, Map<String, dynamic> data,
      {bool merge = false});

  /// Updates fields in the document referred to by [document]
  ///
  /// If the document does not exist, the operation will fail.
  void update(DocumentReference document, Map<String, dynamic> data);
}
