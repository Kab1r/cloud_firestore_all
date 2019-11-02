library cloud_firestore_interfaces;

import 'interfaces/firebase_app.dart';
import 'interfaces/firestore.dart';
import 'interfaces/field_value.dart';

export 'interfaces/field_value.dart';
export 'interfaces/firebase_app.dart';
export 'interfaces/firestore.dart';
export 'interfaces/collection.dart';
export 'interfaces/document.dart';
export 'interfaces/query.dart';

FirebaseApp get appInstance => throw Exception('Unsupported Platform');
Firestore get firestoreInstance => throw Exception('Unsupported Platform');
Future<List<FirebaseApp>> get apps => throw Exception('Unsupported Platform');

FieldValue serverTimestamp() => throw Exception('Unsupported Platform');