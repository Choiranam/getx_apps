import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_apps/database_helper.dart';
import 'package:getx_apps/pages/cart_page/responsive_cart_layout.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Map<String, dynamic>> cartItems = [];

  @override
  void initState() {
    super.initState();
    _loadCartItems();
  }

  Future<void> _loadCartItems() async {
    DatabaseHelper dbHelper = DatabaseHelper();
    cartItems = await dbHelper.getCartItems();
    setState(() {});
  }

  Future<void> _deleteItem(int id) async {
    DatabaseHelper dbHelper = DatabaseHelper();
    await dbHelper.deleteItem(id);
    _loadCartItems(); // Refresh the cart items
  }

  void _showDeleteDialog(int id, String title) {
    Get.defaultDialog(
      title: "Confirmation",
      middleText: "Are you sure you want to delete $title?",
      textConfirm: "OK",
      textCancel: "Cancel",
      onConfirm: () {
        _deleteItem(id); // Delete the item and refresh the cart
        Get.back(); // Close the dialog
      },
      onCancel: () {
        Get.back(); // Just close the dialog without doing anything
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: ResponsiveCartLayout(
        cartItems: cartItems, // Daftar item cart
        showDeleteDialog: _showDeleteDialog, // Fungsi untuk menampilkan dialog konfirmasi
      ),
    );
  }
}
