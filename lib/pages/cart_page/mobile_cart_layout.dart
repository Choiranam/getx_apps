import 'package:flutter/material.dart';

class MobileCartLayout extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;
  final Function(String, int) showDeleteDialog;

  const MobileCartLayout({Key? key, required this.cartItems, required this.showDeleteDialog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                    'assets/images/${item['title'].toLowerCase().replaceAll(" ", "_")}.jpeg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(item['title'], style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('\$${item['price']}', style: TextStyle(color: Colors.grey[600])),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                showDeleteDialog(item['title'], item['id']);
              },
            ),
          ),
        );
      },
    );
  }
}
