/// Sentinel values that can be used when writing document fields with set() or
/// update().
abstract class FieldValue {

  /// Returns a special value that tells the server to remove the given elements from any array value that already exists on the server.
  static dynamic arrayRemove(List elements) => throw Exception('Unsupported Platform');

  /// Returns a special value that tells the server to union the given elements with any array value that already exists on the server.
  static dynamic arrayUnion(List elements) => throw Exception('Unsupported Platform');

  /// Returns a sentinel for use with update() to mark a field for deletion.
  static dynamic delete() => throw Exception('Unsupported Platform');

  /// Returns a special value for use with set() or update() that tells the server to increment the field’s current value by the given value.
  static dynamic increment(num value) => throw Exception('Unsupported Platform');

  /// Returns a sentinel for use with set() or update() to include a server-generated timestamp in the written data.
  static dynamic serverTimestamp() => throw Exception('Unsupported Platform');
}

// A [FieldPath] refers to a field in a document.
abstract class FieldPath {
  /// Returns a sentinel to refer to the ID of a document. It can be used in queries to sort or filter by the document ID.
  static dynamic documentId() => throw Exception('Unsupported Platform');
}
