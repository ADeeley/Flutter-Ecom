import 'package:ecom_app/assets/config/config.dart';
import 'package:ecom_app/widgets/layout/main_app_bar.dart';
import 'package:flutter/material.dart';

import 'product_list.dart';

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: ProductList(),
      backgroundColor: Colors.white,
    );
  }
}
