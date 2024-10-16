import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_apps/database_helper.dart';

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
      body: cartItems.isEmpty
          ? Center(child: Text("No items in the cart"))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  elevation: 5,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/${item['title'].toLowerCase().replaceAll(" ", "_")}.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(item['title'],
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('\$${item['price']}',
                        style: TextStyle(color: Colors.grey[600])),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _showDeleteDialog(item['id'], item['title']);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
