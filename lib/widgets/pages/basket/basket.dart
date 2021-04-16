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
              '${basket.products.length} PRODUCT${basket.products.length > 1 ? "S" : ""}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Divider(color: Colors.grey.shade300),
        ]..addAll(
            basket.products.map(
              (ProductModel product) =>
                  _basketProduct(context, product, basket),
            ),
          ),
      ),
    );
  }
}

Widget _basketProduct(context, ProductModel product, BasketModel basket) {
  final productImage = Transform.rotate(
    angle: Math.pi / 5,
    child: FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      image: product.mainImage,
      fit: BoxFit.fitWidth,
      height: 150,
      width: 150,
    ),
  );

  final productDetails = Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Text(product.name.toUpperCase()),
      ),
      Row(children: [Text('COLOR: ${product.colour}')]),
      Row(children: [Text('SIZE: TBD')]),
      Row(children: [
        Text(
          PriceModel.getPrice(product.price),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ])
    ],
  );

  return Column(children: [
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListTile(title: productDetails, leading: productImage),
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _basketProductButton('MOVE TO BAG', () => {}),
        _basketProductButton('EDIT', () => {}),
        _basketProductButton('DELETE', () async {
          final approved = await _showMyDialog(context);
          if (approved) {
            basket.removeProduct(product.id);
          }
        })
      ],
    ),
    Divider(color: Colors.grey.shade300),
  ]);
}

Widget _basketProductButton(String text, Function onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Row(children: [
      Padding(
        padding: const EdgeInsets.only(right: 4),
        child: Text(text),
      ),
    ]),
  );
}

Future<bool> _showMyDialog(context) async {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[Text('Remove product?')],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Yes'),
            onPressed: () => Navigator.pop(context, true),
          ),
          TextButton(
            child: Text('No'),
            onPressed: () => Navigator.pop(context, false),
          ),
        ],
      );
    },
  );
}
