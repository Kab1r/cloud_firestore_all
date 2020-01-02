library cloud_firestore_mobile;

import 'package:cloud_firestore/cloud_firestore.dart' as mobile_fs;
import 'package:firebase_core/firebase_core.dart' as mobile;

import 'mobile/firebase_app.dart';
import 'mobile/firestore.dart';

export 'mobile/collection.dart';
export 'mobile/document.dart';
export 'mobile/field_value.dart';
export 'mobile/firebase_app.dart';
export 'mobile/firestore.dart';
export 'mobile/query.dart';

FirebaseApp get appInstance => FirebaseApp(mobile.FirebaseApp.instance);
Firestore get firestoreInstance => Firestore(mobile_fs.Firestore.instance);

Future<List<FirebaseApp>> get apps =>
    mobile.FirebaseApp.allApps().then((List<mobile.FirebaseApp> list) =>
        list.map((mobile.FirebaseApp app) => FirebaseApp(app)).toList());
