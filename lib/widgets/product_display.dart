import 'dart:math' as Math;

import 'package:ecom_app/models/price_model.dart';
import 'package:ecom_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductDisplay extends StatelessWidget {
  ProductModel data;

  ProductDisplay(this.data);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.name,
            style: TextStyle(fontSize: 16),
          ),
          Text(
            PriceModel.getPrice(data.price),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(),
            child: Transform.rotate(
              angle: Math.pi / 5,
              child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: data.mainImage,
                  fit: BoxFit.fitWidth),
            ),
          ),
          Text(data.description),
          Text(
            '${data.sizes.join(',')}',
            style: TextStyle(color: Colors.green),
          ),
        ],
      ),
    );
  }
}
