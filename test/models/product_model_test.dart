import 'package:ecom_app/models/price_model.dart';
import 'package:ecom_app/models/product_model.dart';
import 'package:test/test.dart';

void main() {
  test('fromJson should return a ProductModel from a JSON argument', () {
    const mockData = {
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

    final expectation = new ProductModel(
      id: mockData['id'],
      sku: mockData['SKU'],
      name: mockData['name'],
      brandName: mockData['brandName'],
      mainImage: mockData['mainImage'],
      price: PriceModel.fromJson(mockData['price']),
      sizes: mockData['sizes'],
      stockStatus: mockData['stockStatus'],
      colour: mockData['colour'],
      description: mockData['description'],
    );

    final result = ProductModel.fromJson(mockData);

    expect(result.toString(), expectation.toString());
  });
}
