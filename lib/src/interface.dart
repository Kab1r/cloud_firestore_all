library cloud_firestore_interfaces;

import 'interfaces/firebase_app.dart';
import 'interfaces/firestore.dart';

export 'interfaces/collection.dart';
export 'interfaces/document.dart';
export 'interfaces/field_value.dart';
export 'interfaces/firebase_app.dart';
export 'interfaces/firestore.dart';
export 'interfaces/query.dart';

/// Returns the default (first initialized) instance of the FirebaseApp.
FirebaseApp get appInstance => throw Exception('Unsupported Platform');

/// Returns the instance of Firestore for the default Firebase app.
Firestore get firestoreInstance => throw Exception('Unsupported Platform');

/// Returns a list of all extant FirebaseApp instances, or null if there are no FirebaseApp instances.
Future<List<FirebaseApp>> get apps => throw Exception('Unsupported Platform');

