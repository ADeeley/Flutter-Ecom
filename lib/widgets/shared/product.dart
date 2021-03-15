import 'dart:math' as Math;
import 'package:ecom_app/models/price_model.dart';
import 'package:ecom_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class Product extends StatelessWidget {
  final ProductModel data;
  const Product({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Transform.rotate(
                angle: Math.pi / 5,
                child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: data.mainImage,
                    height: 160)),
          ),
          Text(
            data.name,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              PriceModel.getPrice(data.price),
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
