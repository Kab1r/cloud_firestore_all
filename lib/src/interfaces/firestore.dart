import 'collection.dart';
import 'document.dart';
import 'firebase_app.dart';

abstract class Firestore {

  FirebaseApp get app;

  CollectionReference collection(String path);
  DocumentReference document(String path);
}