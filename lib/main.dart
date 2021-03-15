import 'package:ecom_app/widgets/layout/main_bottom_navigation_bar.dart';
import 'package:ecom_app/widgets/pages/plp/product_list_page.dart';
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
        // primarySwatch: Colors.lightBlue,
        primaryColor: Colors.yellow,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue.shade900,
        ),
      ),
      home: Scaffold(
        body: ProductListPage(),
        bottomNavigationBar: MainBottomNavigationBar(),
      ),
    );
  }
}
