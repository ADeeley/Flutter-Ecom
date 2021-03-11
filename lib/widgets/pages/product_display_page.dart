import 'package:ecom_app/assets/config/config.dart';
import 'package:flutter/material.dart';

import '../product_list.dart';

class ProductDisplayPage extends StatelessWidget {
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
              Icons.toc_sharp,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        children: [Text('pdp')],
      ),
      backgroundColor: Colors.white,
    );
  }
}
