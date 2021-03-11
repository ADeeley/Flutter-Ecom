import 'package:ecom_app/widgets/pages/product_display_page.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:ecom_app/models/product_model.dart';
import 'package:ecom_app/services/products_service.dart';
import 'package:ecom_app/widgets/product.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  Future<List<ProductModel>> _products =
      ProductsService(new Dio()).getProducts();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
        future: _products,
        builder:
            (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
          return GridView.count(
            childAspectRatio: 0.6,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            padding: EdgeInsets.all(8), // Padding around the list
            children: _listItems(snapshot),
          );
        });
  }

  List<Widget> _listItems(AsyncSnapshot<List<ProductModel>> snapshot) {
    if (snapshot.data != null) {
      return snapshot.data
          .map(
            (productData) => GestureDetector(
              child: new Product(data: productData),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDisplayPage(productData),
                  ),
                );
              },
            ),
          )
          .toList();
    } else /* display loading text */ {
      return [Text('Loading...')];
    }
  }
}
