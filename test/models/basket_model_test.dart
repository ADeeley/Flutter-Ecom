import 'dart:convert';

import 'package:ecom_app/models/basket_model.dart';
import 'package:ecom_app/models/product_model.dart';
// import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('fromJson should return a BasketModel from a JSON argument', () {
    TestWidgetsFlutterBinding.ensureInitialized();
    final productsJson = {
      "id": "1",
      "SKU": "1210",
      "name": "Nike Air Relentless 4 Mens Running Shoes",
      "brandName": "Nike",
      "mainImage": "https://test.com",
      "price": {"amount": "45.00", "currency": "GBP"},
      "sizes": ["8", "9", "10", "11"],
      "stockStatus": "IN STOCK",
      "colour": "blue",
      "description": "Hit the tracks..."
    };
    final products = [ProductModel.fromJson(productsJson)];

    final expectation = new BasketModel(
      products: products,
    );

    final result = BasketModel.fromJson(productsJson);

    expect(result.toString(), expectation.toString());
  });
}

// TODO: Adam, figure out 'unable to load asset' issue
// Future loadMockJson() async {
//   final String productMock = await rootBundle.loadString('json_data.json');
//   final productsJson = json.decode(productMock);
//   return productsJson;
// }
