import 'package:flutter/material.dart';

class MainBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        buildBottomNavigationBarItem(Icons.add_circle_outline),
        buildBottomNavigationBarItem(Icons.zoom_in_outlined),
        buildBottomNavigationBarItem(Icons.shopping_bag_outlined),
        buildBottomNavigationBarItem(Icons.favorite_outline),
        buildBottomNavigationBarItem(Icons.person_outline_outlined),
      ],
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(IconData iconType) {
    return BottomNavigationBarItem(
      icon: Icon(
        iconType,
        color: Colors.blue.shade900,
        size: 30,
      ),
      label: '',
      backgroundColor: Colors.white,
    );
  }
}
