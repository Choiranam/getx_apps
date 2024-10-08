import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_apps/controller/bottom_nav_controller.dart';
import 'package:getx_apps/pages/menus/home.dart';
import 'package:getx_apps/pages/menus/cart.dart';
import 'package:getx_apps/pages/menus/profile.dart';
import 'package:getx_apps/pages/menus/custom_bottom_navigation_bar.dart';
import 'package:getx_apps/pages/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController bottomNavController = Get.find<BottomNavController>();

    final List<Widget> menus = [Home(), Cart(), Profile()];

    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Home"),
          backgroundColor: Colors.redAccent,
        ),
        body: menus[bottomNavController.selectedIndex.value],
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: bottomNavController.selectedIndex.value,
          onTap: bottomNavController.changeIndexMenu,
        ),
      );
    });
  }
}
