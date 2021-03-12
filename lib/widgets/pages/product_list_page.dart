import 'package:ecom_app/assets/config/config.dart';
import 'package:flutter/material.dart';

import '../product_list.dart';

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(config['appTitle'],
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'Helvetica')),
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: ProductList(),
      backgroundColor: Colors.white,
    );
  }
}
