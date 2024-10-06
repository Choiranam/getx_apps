import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:getx_apps/controller/login_controller.dart';
import 'package:getx_apps/components/reusable_card.dart';

class Profile extends StatelessWidget {
  final LoginController loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    String name = 'Muhammad Choirulanam';
    String email = 'mchoiranam@gmail.com';
    
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ReusableCard(
                imageAsset: 'assets/images/fritzy.jpeg',
                title: name,
                subtitle: email,
                price: '',
                isHorizontal: false,
              ),
              SizedBox(height: 10), 
              ElevatedButton(
                onPressed: () async {
                  await loginController.logout();
                  Get.offNamed('login');
                },
                child: Text("Logout"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
