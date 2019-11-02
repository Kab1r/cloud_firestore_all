import '../interface.dart' as intf;
import 'package:firebase/firestore.dart' as web;

class FieldValue implements intf.FieldValue {
  web.FieldValue fieldValue;
  FieldValue(this.fieldValue);
}
