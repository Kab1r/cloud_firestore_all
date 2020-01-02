import '../interface.dart' as intf;
import 'package:firebase/firebase.dart' as web;

class FirebaseApp implements intf.FirebaseApp {
  web.App _firebaseApp;
  FirebaseApp(this._firebaseApp);

  @override
  String get name => _firebaseApp.name;
}
