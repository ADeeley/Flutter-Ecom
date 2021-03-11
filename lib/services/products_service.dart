import 'package:dio/dio.dart';
import 'package:ecom_app/models/product_model.dart';

class ProductsService {
  Dio dio;

  ProductsService(this.dio);

  Future<List<dynamic>> getProducts() async {
    Response<dynamic> response;

    try {
      response = await dio.get(
          'https://s3-eu-west-1.amazonaws.com/api.themeshplatform.com/products.json',
          options: Options(responseType: ResponseType.json));
    } on DioError catch (error) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (error.response != null) {
        print(error.response.data);
        print(error.response.headers);
        print(error.response.request);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(error.request);
        print(error.message);
      }

      // Nothing to parse further at this point so just return
      return null;
    }

    final List<dynamic> data = response.data;
    return _toProductList(data);
  }

  List<ProductModel> _toProductList(List<dynamic> data) {
    final List<ProductModel> productList = data
        .map((productJson) => ProductModel.fromJson(productJson))
        .toList(); // extract to product list method in ProductModel
    return productList;
  }
}
