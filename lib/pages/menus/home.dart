import 'package:flutter/material.dart';
import 'package:getx_apps/components/reusable_card.dart';

extension StringCapitalization on String {
  String capitalize() {
    if (this.isEmpty) return this;
    return '${this[0].toUpperCase()}${this.substring(1)}';
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Food App',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent, // Warna teks
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Discover delicious burgers from around the world!',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 32),

            // Bagian Top Picks
            Text(
              'Top Picks',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green, // Warna header
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  List<String> burgerNames = [
                    'classic_cheeseburger',
                    'bacon_bbq_burger',
                    'mushroom_swiss_burger',
                    'jalapeno_burger',
                    'veggie_burger'
                  ];

                  return Container(
                    width: 140,
                    margin: EdgeInsets.only(right: 16),
                    child: ReusableCard(
                      imageAsset: 'assets/images/${burgerNames[index]}.jpeg',
                      title: burgerNames[index].replaceAll('_', ' ').capitalize(),
                      subtitle: 'Delicious burger with amazing flavors.',
                      price: '\$${(index + 1) * 5}.00',
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 32),

            // Bagian Our Recommendations
            Text(
              'Our Recommendations',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 16),
            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                List<String> recommendedBurgers = [
                  'double_decker_burger',
                  'fish_burger',
                  'breakfast_burger',
                ];

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ReusableCard(
                    imageAsset: 'assets/images/${recommendedBurgers[index]}.jpeg',
                    title: recommendedBurgers[index].replaceAll('_', ' ').capitalize(),
                    subtitle: 'A delicious recommendation for you!',
                    price: '\$${(index + 1) * 6}.00',
                    isHorizontal: true,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
