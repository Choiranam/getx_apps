import 'package:flutter/material.dart';
import 'package:getx_apps/components/reusable_card.dart';

extension StringCapitalization on String {
  String capitalize() {
    if (this.isEmpty) return this;
    return '${this[0].toUpperCase()}${this.substring(1)}';
  }
}

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Cart',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Review your selected burgers before purchase!',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 32),

            // Bagian untuk menampilkan kartu burger
            Text(
              'Selected Burgers',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 290,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(8, (index) {
                    List<String> burgerNames = [
                      'bacon_bbq_burger',
                      'classic_cheeseburger',
                      'mushroom_swiss_burger',
                      'jalapeno_burger',
                      'veggie_burger',
                      'double_decker_burger',
                      'fish_burger',
                      'breakfast_burger'
                    ];

                    return Container(
                      width: 150, // Lebar kartu
                      margin: EdgeInsets.only(right: 16), // Jarak antar kartu
                      child: Column(
                        children: [
                          Expanded(
                            child: ReusableCard(
                              imageAsset:
                                  'assets/images/${burgerNames[index]}.jpeg',
                              title: burgerNames[index]
                                  .replaceAll('_', ' ')
                                  .capitalize(),
                              price: 'Rp.${(index + 1) * 5000}',
                            ),
                          ),
                          SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                            },
                            child: Text('Buy'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              minimumSize: Size.fromHeight(40),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
