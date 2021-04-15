import 'package:ecom_app/models/basket_model.dart';
import 'package:ecom_app/models/price_model.dart';
import 'package:ecom_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'dart:math' as Math;

class Basket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BasketModel basket = Provider.of<BasketModel>(context, listen: true);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${basket.products.length} PRODUCTS',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            color: Colors.grey.shade300,
          ),
        ]..addAll(basket.products
            .map((ProductModel product) => basketProduct(product, basket))),
      ),
    );
  }
}

Column basketProduct(ProductModel product, BasketModel basket) {
  return Column(children: [
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListTile(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                product.name.toUpperCase(),
              ),
            ),
            Row(
              children: [
                Text(
                  'COLOR: ${product.colour}',
                ),
              ],
            ),
            Row(
              children: [
                Text('SIZE: TBD'),
              ],
            ),
            Row(
              children: [
                Text(
                  PriceModel.getPrice(
                    product.price,
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
            image: product.mainImage,
            fit: BoxFit.fitWidth,
            height: 150,
            width: 150,
          ),
        ),
      ),
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () => {},
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Text("MOVE TO BAG"),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () => {},
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Text("EDIT"),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () => basket.removeProduct(product.id),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Text("DELETE"),
              ),
            ],
          ),
        )
      ],
    ),
    Divider(
      color: Colors.grey.shade300,
    ),
  ]);
}
