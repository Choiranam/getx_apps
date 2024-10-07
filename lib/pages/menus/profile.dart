import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_apps/controller/login_controller.dart';
import 'package:getx_apps/components/reusable_profile.dart';

class Profile extends StatelessWidget {
  final LoginController loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    String name = 'Muhammad Choirulanam';
    String email = 'mchoiranam@gmail.com';
    String birthday = '29 April 2008';
    String phone = '+62 856-0121-1156';
    String instagram = '@choiranamm';
    String password = '********';

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/fritzy.jpeg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ProfileInfoCard(
              icon: Icons.cake_outlined,
              title: birthday,
            ),
            ProfileInfoCard(
              icon: Icons.phone_outlined,
              title: phone,
            ),
            ProfileInfoCard(
              icon: Icons.camera_alt_outlined,
              title: instagram,
            ),
            ProfileInfoCard(
              icon: Icons.email_outlined,
              title: email,
            ),
            ProfileInfoCard(
              icon: Icons.lock_outline,
              title: password,
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                await loginController.logout();
                Get.offNamed('login');
              },
              child: Text("Logout"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
