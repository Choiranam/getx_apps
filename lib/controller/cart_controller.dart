import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <String>[].obs;

  void addItemToCart(String item) {
    cartItems.add(item);
  }

  void removeItemFromCart(int index) {
    cartItems.removeAt(index);
  }
}
