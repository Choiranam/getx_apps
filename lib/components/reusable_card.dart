import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String subtitle;
  final String price;
  final bool isHorizontal;

  const ReusableCard({
    required this.imageAsset,
    required this.title,
    required this.subtitle,
    required this.price,
    this.isHorizontal = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      child: isHorizontal
          ? Row(
              children: [
                Image.asset(imageAsset, width: 80, height: 80, fit: BoxFit.cover),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(subtitle),
                      Text(price, style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Image.asset(imageAsset, fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(subtitle),
                      Text(price, style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
