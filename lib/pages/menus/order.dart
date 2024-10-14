import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_apps/database_helper.dart';

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
        title: Text("Order Page"),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      items[index]['image'],
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          items[index]['title'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '\$${items[index]['price']}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Menyiapkan data dalam bentuk Map
                      Map<String, dynamic> itemData = {
                        'title': items[index]['title'],
                        'price': items[index]['price'],
                      };

                      // Memasukkan item ke dalam database
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
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
