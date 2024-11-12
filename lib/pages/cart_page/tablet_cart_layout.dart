import 'package:flutter/material.dart';

class TabletCartLayout extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;
  final Function(String, int) showDeleteDialog;

  const TabletCartLayout({
    Key? key,
    required this.cartItems,
    required this.showDeleteDialog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 4,
      ),
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final item = cartItems[index];
        return Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, // Memenuhi lebar card
              children: [
                // Bagian gambar
                Expanded(
                  child: Container(
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
                ),
                const SizedBox(height: 10),
                // Judul
                Text(
                  item['title'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                // Harga
                Text(
                  '\$${item['price']}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 10),
                // Tombol hapus
                Align(
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      showDeleteDialog(item['title'], item['id']);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
