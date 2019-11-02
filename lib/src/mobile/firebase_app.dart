import '../interface.dart' as intf;
import 'package:firebase_core/firebase_core.dart' as mobile;

class FirebaseApp implements intf.FirebaseApp {
  mobile.FirebaseApp _firebaseApp;
  FirebaseApp(this._firebaseApp);

  @override
  String get name => _firebaseApp.name;
}
