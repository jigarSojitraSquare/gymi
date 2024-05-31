import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  static void showToaster(String message) {
    if(message == "invalid-credential"){
      Fluttertoast.showToast(msg: "Invalid email or password");
    } else{
      Fluttertoast.showToast(msg: message);
    }
  }
}

