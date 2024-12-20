import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:getx_apps/pages/login_page.dart';
import 'package:getx_apps/pages/home_page.dart';
import 'package:getx_apps/pages/menus/cart.dart';
import 'package:getx_apps/controller/login_controller.dart';
import 'package:getx_apps/controller/bottom_nav_controller.dart';
import 'package:getx_apps/controller/cart_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi SharedPreferences
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  Get.put(LoginController());
  Get.put(BottomNavController());
  Get.put(CartController()); // Tambahkan CartController

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Food App',
      initialRoute: isLoggedIn ? '/homepage' : '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/homepage', page: () => HomePage()),
        GetPage(name: '/cart', page: () => Cart()),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
