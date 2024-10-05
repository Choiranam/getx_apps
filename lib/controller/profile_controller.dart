import 'package:get/get.dart';

class ProfileController extends GetxController {
  var username = 'admin'.obs;
  var email = 'admin@foodapp.com'.obs;

  void updateProfile(String newName, String newEmail) {
    username.value = newName;
    email.value = newEmail;
  }
}
