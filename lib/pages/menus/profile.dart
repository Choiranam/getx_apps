import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:getx_apps/controller/login_controller.dart';

class Profile extends StatelessWidget {
  final LoginController loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    String name = 'Muhammad Choirulanam';
    String email = 'mchoiranam@gmail.com';

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Foto Profil
            CircleAvatar(
              radius: 50, // Ukuran foto profil
              backgroundImage: AssetImage('assets/images/fritzy.jpeg'),
            ),
            SizedBox(height: 20),
            // Nama
            Text(
              name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Email
            Text(
              email,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 30),
            // Tombol Logout
            ElevatedButton(
              onPressed: () async {
                await loginController.logout();
                Get.offNamed('login');
              },
              child: Text("Logout"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
