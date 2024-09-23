import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_apps/pages/home_page.dart';
import 'package:getx_apps/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        // list all pages here    
        GetPage(name: '/', page: () => LoginPage(),),
        GetPage(name: '/homepage', page: () => HomePage(),),
      ],
    );
  }
}