import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_apps/database_helper.dart';
import 'package:getx_apps/components/reusable_card.dart';

class Order extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      'title': 'Classic Cheeseburger',
      'price': 10.0,
      'image': 'assets/images/classic_cheeseburger.jpeg',
    },
    {
      'title': 'Bacon BBQ Burger',
      'price': 12.0,
      'image': 'assets/images/bacon_bbq_burger.jpeg',
    },
    {
      'title': 'Mushroom Swiss Burger',
      'price': 11.0,
      'image': 'assets/images/mushroom_swiss_burger.jpeg',
    },
    {
      'title': 'Jalapeno Burger',
      'price': 13.0,
      'image': 'assets/images/jalapeno_burger.jpeg',
    },
    {
      'title': 'Veggie Burger',
      'price': 9.0,
      'image': 'assets/images/veggie_burger.jpeg',
    },
    {
      'title': 'Double Decker Burger',
      'price': 14.0,
      'image': 'assets/images/double_decker_burger.jpeg',
    },
    {
      'title': 'Fish Burger',
      'price': 11.0,
      'image': 'assets/images/fish_burger.jpeg',
    },
    {
      'title': 'Breakfast Burger',
      'price': 10.0,
      'image': 'assets/images/breakfast_burger.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ReusableCard(
                imageAsset: items[index]['image'],
                title: items[index]['title'],
                price: '\$${items[index]['price']}',
                isHorizontal: true,
                additionalWidget: ElevatedButton(
                  onPressed: () async {
                    Map<String, dynamic> itemData = {
                      'title': items[index]['title'],
                      'price': items[index]['price'],
                    };

                    DatabaseHelper dbHelper = DatabaseHelper();
                    await dbHelper.insertItem(itemData);
                    Get.snackbar(
                      'Success',
                      '${items[index]['title']} added to cart!',
                      snackPosition: SnackPosition.TOP,
                      duration: Duration(seconds: 2),
                    );
                  },
                  child: Text("Buy"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
