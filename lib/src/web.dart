library cloud_firestore_web;

import 'package:firebase/firebase.dart' as web;
import 'package:firebase/firestore.dart' as web_fs;

import 'web/firebase_app.dart';
import 'web/firestore.dart';

export 'web/collection.dart';
export 'web/document.dart';
export 'web/firebase_app.dart';
export 'web/firestore.dart';
export 'web/query.dart';

FirebaseApp get appInstance => FirebaseApp(web.app());
Firestore get firestoreInstance => Firestore(web.firestore());

Future<List<FirebaseApp>> get apps =>
    Future.value(web.apps.map((web.App app) => FirebaseApp(app)).toList());

dynamic serverTimestamp() => web_fs.FieldValue.serverTimestamp();
