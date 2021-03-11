import 'dart:math' as Math;
import 'package:ecom_app/models/product_model.dart';
import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final ProductModel data;
  const Product({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Transform.rotate(
              angle: Math.pi / 5, child: Image.network(data.mainImage)),
          Text(
            data.name,
            style: TextStyle(fontSize: 16),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              '£${data.price.amount}', // Add method in pricing model to return formatted currency (can flutter do this with a currency widget???)
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            'Sizes in stock:',
            style: TextStyle(color: Colors.green),
          ),
          Text(
            '${data.sizes.join(',')}',
            style: TextStyle(color: Colors.green),
          ),
        ],
      ),
    );
  }
}
