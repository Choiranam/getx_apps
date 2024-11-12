import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveCartLayout extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;
  final Function(int id, String title) showDeleteDialog;

  const ResponsiveCartLayout({
    Key? key,
    required this.cartItems,
    required this.showDeleteDialog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Gunakan LayoutBuilder untuk menentukan ukuran layar
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          // Mobile layout
          return ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return _buildCartItem(item);
            },
          );
        } else {
          // Tablet layout
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
            ),
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return _buildCartItem(item);
            },
          );
        }
      },
    );
  }

  Widget _buildCartItem(Map<String, dynamic> item) {
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
            showDeleteDialog(item['id'], item['title']);
          },
        ),
      ),
    );
  }
}
