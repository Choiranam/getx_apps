import 'package:flutter/material.dart';
import 'package:getx_apps/components/reusable_card.dart';
import 'package:getx_apps/components/reusable_textfield.dart';

class Profile extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        automaticallyImplyLeading: false, // Hapus panah kembali
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReusableTextField(
                hintText: 'Nama Lengkap',
                controller: nameController,
              ),
              SizedBox(height: 16),
              ReusableTextField(
                hintText: 'Email',
                controller: emailController,
              ),
              SizedBox(height: 16),
              ReusableTextField(
                hintText: 'Nomor Telepon',
                controller: phoneController,
              ),
              SizedBox(height: 20),
              ReusableCard(
                imageAsset: 'assets/images/fritzy.jpeg',
                title: 'Judul',
                subtitle: 'Deskripsi',
                price: 'Harga',
                isHorizontal: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
