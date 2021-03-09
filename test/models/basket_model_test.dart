import 'package:ecom_app/models/basket_model.dart';
import 'package:ecom_app/models/product_model.dart';
// import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Shared test values
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

  group('fromJson', () {
    test('should return a BasketModel from a JSON argument', () {
      final expectation = new BasketModel(products: products);
      final result = BasketModel.fromJson(productsJson);

      expect(result.toString(), expectation.toString());
    });

    test('should set products to empty if no products are provided', () {
      final result = BasketModel.fromJson({"products": []});

      expect(result.products, []);
    });
  });

  group('addProduct', () {
    test('should add a single product to the basket', () {
      final basket = new BasketModel(products: []);

      basket.addProduct(products.first);

      expect(basket.products, [products.first]);
    });

    test('should add a new product for each sequential call', () {
      final basket = new BasketModel(products: []);

      basket.addProduct(products.first);
      basket.addProduct(products.first);

      expect(basket.products, [products.first, products.first]);
    });

    test('should return early if the product provided is null', () {
      final basket = new BasketModel(products: []);

      basket.addProduct(null);

      expect(basket.products, []);
    });
  });
}

// TODO: Adam, figure out 'unable to load asset' issue
// Future loadMockJson() async {
//   final String productMock = await rootBundle.loadString('json_data.json');
//   final productsJson = json.decode(productMock);
//   return productsJson;
// }
