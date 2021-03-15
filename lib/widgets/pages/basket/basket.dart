import 'package:ecom_app/models/price_model.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'dart:math' as Math;

class Basket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListTile(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Nike Air Relentless 4 Mens Running Shoes'.toUpperCase(),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'COLOR: Black',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('SIZE: 10'),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      PriceModel.getPrice(
                        new PriceModel(amount: '10', currency: 'GBP'),
                      ),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
            leading: Transform.rotate(
              angle: Math.pi / 5,
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image:
                    "https://s3-eu-west-1.amazonaws.com/api.themeshplatform.com/media/7e386191b2ee40b290886a05d3e10e24_nike-air-relentless-a.jpg",
                fit: BoxFit.fitWidth,
                height: 150,
                width: 150,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
