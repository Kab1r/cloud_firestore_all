library cloud_firestore_all;

export 'src/interface.dart'
    if (dart.library.io) 'src/mobile.dart'
    if (dart.library.js) 'src/web.dart';

//export 'src/timestamp.dart';
export 'package:cloud_firestore_platform_interface/src/timestamp.dart';
