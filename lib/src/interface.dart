abstract class Firestore {
  static Firestore get instance {
    return null;
  }

  CollectionReference collection(String path);
}

abstract class CollectionReference {
  Stream<QuerySnapshot> get onSnapshot;
  String get path;
  String get id;

  DocumentReference doc([String path]);
}

abstract class QuerySnapshot {
  List<DocumentSnapshot> get docs;
}

abstract class DocumentSnapshot {
  DocumentReference get ref;
  String get id;
  Map<String, dynamic> get data;
}

abstract class DocumentReference {
  String get id;
  Stream<DocumentSnapshot> get onSnapshot;
  CollectionReference get parent;
  String get path;

  Future<void> delete();
  Future<DocumentSnapshot> get();
  Future<void> set(Map<String, dynamic> data);
  Future<void> update({Map<String, dynamic> data});
}

void initializeApp(
        [String apiKey,
        String authDomain,
        String databaseURL,
        String projectId,
        String storageBucket]) =>
    throw Exception('Unsupported Platform');
