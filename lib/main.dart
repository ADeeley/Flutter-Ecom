import 'package:ecom_app/widgets/pages/product_list_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Scaffold(
        body: ProductListPage(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            buildBottomNavigationBarItem(Icons.add_circle_outline),
            buildBottomNavigationBarItem(Icons.zoom_in_outlined),
            buildBottomNavigationBarItem(Icons.shopping_bag_outlined),
            buildBottomNavigationBarItem(Icons.favorite_outline),
            buildBottomNavigationBarItem(Icons.person_outline_outlined),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
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
