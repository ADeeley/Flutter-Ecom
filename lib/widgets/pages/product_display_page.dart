import 'package:ecom_app/assets/config/config.dart';
import 'package:ecom_app/models/product_model.dart';
import 'package:ecom_app/widgets/product_display.dart';
import 'package:flutter/material.dart';

class ProductDisplayPage extends StatelessWidget {
  ProductModel data;

  ProductDisplayPage(this.data);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            config['appTitle'],
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Helvetica',
            ),
          ),
          iconTheme: IconThemeData(color: Colors.white),
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
        body: ProductDisplay(data),
        backgroundColor: Colors.white,
      );
}
