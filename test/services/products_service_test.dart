import 'package:dio/dio.dart';
import 'package:ecom_app/models/product_model.dart';
import 'package:ecom_app/services/products_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

const mockProductResponse = [
  {
    "id": "1",
    "SKU": "1210",
    "name": "Nike Air Relentless 4 Mens Running Shoes",
    "brandName": "Nike",
    "mainImage":
        "https://s3-eu-west-1.amazonaws.com/api.themeshplatform.com/media/7e386191b2ee40b290886a05d3e10e24_nike-air-relentless-a.jpg",
    "price": {"amount": "45.00", "currency": "GBP"},
    "sizes": ["8", "9", "10", "11"],
    "stockStatus": "IN STOCK",
    "colour": "blue",
    "description":
        "Hit the tracks in these Nike Air Relentless 4 featuring flexible forefoot sole and Reslon midsole underfoot cushioning for superior comfort at each step. The ridged outsole ensures excellent traction while the cushioned ankle collar and the anatomically shaped insole guarantee great support for the whole foot. The mesh upper panels provide breathability and airflow within the shoe."
  }
];

void main() async {
  final dio = Dio();
  final dioAdapter = DioAdapter();

  dio.httpClientAdapter = dioAdapter;
  group('getProducts', () {
    test('should get and return products from the endpoint', () async {
      final productsService = new ProductsService(dio);

      dioAdapter
          .onGet(
              'https://s3-eu-west-1.amazonaws.com/api.themeshplatform.com/products.json') // extract to service URLS
          .reply(200, mockProductResponse);

      final List<ProductModel> response = await productsService.getProducts();

      expect(response.first.toString(),
          ProductModel.fromJson(mockProductResponse.first).toString());
    });

// TODO: test other http response codes using loop
    test('should return a null if the call fails', () async {
      final productsService = new ProductsService(dio);

      dioAdapter
          .onGet(
              'https://s3-eu-west-1.amazonaws.com/api.themeshplatform.com/products.json') // extract to service URLS
          .reply(500, '');

      final List<ProductModel> response = await productsService.getProducts();

      expect(response, null);
    });

    test('should return a null if the call returns 404', () async {
      final productsService = new ProductsService(dio);

      dioAdapter
          .onGet(
              'https://s3-eu-west-1.amazonaws.com/api.themeshplatform.com/products.json') // extract to service URLS
          .reply(404, '');

      final List<ProductModel> response = await productsService.getProducts();

      expect(response, null);
    });
  });
}
