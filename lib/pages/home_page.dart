import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_apps/pages/menus/home.dart';
import 'package:getx_apps/pages/menus/order.dart';
import 'package:getx_apps/pages/menus/cart.dart';
import 'package:getx_apps/pages/menus/profile.dart';
import 'package:getx_apps/pages/menus/custom_bottom_navigation_bar.dart';
import 'package:getx_apps/controller/bottom_nav_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController bottomNavController = Get.find<BottomNavController>();

    final List<Widget> menus = [Home(), Order(), Cart(), Profile()];

    return Obx(() {
      return Scaffold(
        body: menus[bottomNavController.selectedIndex.value],
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: bottomNavController.selectedIndex.value,
          onTap: bottomNavController.changeIndexMenu,
        ),
      );
    });
  }
}
