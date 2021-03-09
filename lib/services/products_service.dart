import 'package:dio/dio.dart';
import 'package:ecom_app/models/product_model.dart';

class ProductsService {
  Dio dio;

  ProductsService(this.dio);

  Future<List<dynamic>> getProducts() async {
    final Response<dynamic> response = await dio.get(
        'https://s3-eu-west-1.amazonaws.com/api.themeshplatform.com/products.json',
        options: Options(responseType: ResponseType.json));

    final List<dynamic> data = response.data;
    final productList = data
        .map((productJson) => ProductModel.fromJson(productJson))
        .toList(); // extract to product list method in ProductModel

    return productList;
  }
}
