import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;

  Future<bool> login() async {
    await Future.delayed(Duration(seconds: 1));
    if (username.value == 'admin' && password.value == 'admin') {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    username.value = '';
    password.value = '';
  }
}
