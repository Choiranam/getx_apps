import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_apps/controller/bottom_nav_contoller.dart';
import 'package:getx_apps/pages/menus/home.dart';
import 'package:getx_apps/pages/menus/favorites.dart';
import 'package:getx_apps/pages/menus/cart.dart';
import 'package:getx_apps/pages/menus/profile.dart';
import 'package:getx_apps/pages/menus/custom_bottom_navigation_bar.dart';
import 'package:getx_apps/pages/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavContoller bottomNavContoller = Get.put(BottomNavContoller());

    // Ubah urutan halaman
    final List<Widget> menus = [Home(), Favorites(), Cart(), Profile()];

    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
        ),
        body: menus[bottomNavContoller.selectedIndex.value],
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: bottomNavContoller.selectedIndex.value,
          onTap: bottomNavContoller.changeIndexMenu,
        ),
      );
    });
  }
}
