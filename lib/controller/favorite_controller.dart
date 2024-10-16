import 'package:get/get.dart';

class FavoriteController extends GetxController {
  var favoriteBurgers = <String>[].obs;

  void toggleFavorite(String burger) {
    if (favoriteBurgers.contains(burger)) {
      favoriteBurgers.remove(burger);
    } else {
      favoriteBurgers.add(burger);
    }
  }
}
