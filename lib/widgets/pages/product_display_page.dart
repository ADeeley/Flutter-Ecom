import 'package:ecom_app/models/product_model.dart';
import 'package:ecom_app/widgets/layout/main_app_bar.dart';
import 'package:ecom_app/widgets/layout/main_bottom_navigation_bar.dart';
import 'package:ecom_app/widgets/product_display.dart';
import 'package:flutter/material.dart';

class ProductDisplayPage extends StatelessWidget {
  ProductModel data;

  ProductDisplayPage(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: ProductDisplay(data),
      backgroundColor: Colors.white,
      bottomNavigationBar: MainBottomNavigationBar(),
    );
  }
}
