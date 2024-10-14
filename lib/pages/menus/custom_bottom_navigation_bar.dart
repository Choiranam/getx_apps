import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final List<IconData> iconList = [
      Icons.home,
      Icons.task,
      Icons.shopping_cart,
      Icons.person,
    ];

    final List<String> labels = ["Home", "Order", "Cart", "Profile"];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 12,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onTap,
        items: List.generate(iconList.length, (index) {
          return BottomNavigationBarItem(
            icon: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              child: Icon(
                iconList[index],
                color: selectedIndex == index ? Colors.blueAccent : Colors.grey,
                size: selectedIndex == index ? 30 : 24,
              ),
            ),
            label: labels[index],
          );
        }),
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
