import 'package:ecom_app/models/basket_model.dart';
import 'package:ecom_app/models/product_model.dart';
// import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Shared test values
  const product1Json = {
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
  const product2Json = {
    "id": "2",
    "SKU": "1219",
    "name": "PUMA Future Disc Lite Op V2",
    "brandName": "Puma",
    "mainImage":
        "https://s3-eu-west-1.amazonaws.com/api.themeshplatform.com/media/a752937bd1be4ca3b6ccba5f7649a21c_35685902_fr_puma_sc7.jpeg",
    "price": {"amount": "90.00", "currency": "GBP"},
    "sizes": ["8", "9", "10", "11"],
    "stockStatus": "IN STOCK",
    "colour": "multicoloured",
    "description":
        "A product of the 90s, the PUMA Future Disc Lite OP V2 features the PUMA disc, the fit system that offered those comfort-boosting clicks. Its modern reincarnation is more laid-back, but brings the technology of the original. Features a leather and mesh upper, EVA midsole, and rubber outsole"
  };

  const product3Json = {
    "id": "3",
    "SKU": "1243",
    "name": "PUMA Soleil v2",
    "brandName": "Puma",
    "mainImage":
        "https://s3-eu-west-1.amazonaws.com/api.themeshplatform.com/media/ce1fbd10feb64bd39816d03a45fa5346_35892701_fr_puma_sc7.jpeg",
    "price": {"amount": "40.00", "currency": "GBP"},
    "sizes": ["8", "9", "10", "11"],
    "stockStatus": "IN STOCK",
    "colour": "black",
    "description":
        "Simple and clean, the Soleil v2 exhibits iconic PUMA heritage.Synthetic upper with french piping embellishment and bold ghilles.Rubber outsole supplies durability and traction."
  };

  final product1 = ProductModel.fromJson(product1Json);
  final product2 = ProductModel.fromJson(product2Json);
  final product3 = ProductModel.fromJson(product3Json);

  final products = [product1];

  group('fromJson', () {
    test('should return a BasketModel from a JSON argument', () {
      final expectation = new BasketModel(products: products);
      final result = BasketModel.fromJson(product1Json);

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

  group('removeProduct', () {
    test('should remove a product with the given ID from the basket', () {
      final basket = new BasketModel(products: [product1, product2, product3]);

      basket.removeProduct(product2.id);
      expect(basket.products, [product1, product3]);

      basket.removeProduct(product1.id);
      expect(basket.products, [product3]);

      basket.removeProduct(product3.id);
      expect(basket.products, []);
    });

    test('should return early if null is provided', () {
      final basket = new BasketModel(products: [product1, product2, product3]);

      basket.removeProduct(null);
      expect(basket.products, [product1, product2, product3]);
    });
  });
}

// TODO: Adam, figure out 'unable to load asset' issue
// Future loadMockJson() async {
//   final String productMock = await rootBundle.loadString('json_data.json');
//   final productsJson = json.decode(productMock);
//   return productsJson;
// }
