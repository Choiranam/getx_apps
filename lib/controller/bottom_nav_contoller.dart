import 'package:get/get.dart';

class BottomNavContoller extends GetxController {

  // contains all logical operations method and variables
  var selectedIndex = 0.obs;
  void changeIndexMenu(int index) {
    selectedIndex.value = index;
  }
}