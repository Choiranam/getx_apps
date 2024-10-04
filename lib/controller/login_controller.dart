import 'package:get/get.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;

  // Fungsi untuk validasi login
  bool login() {
    if (username.value == 'admin' && password.value == 'admin') {
      return true;
    } else {
      return false;
    }
  }
}
