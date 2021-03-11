import 'package:dio/dio.dart';
import 'package:ecom_app/models/product_model.dart';
import 'package:ecom_app/services/products_service.dart';
import 'package:flutter/material.dart';

// Contains constants for the app
// TODO: AD should be extracted into enums and external config
Map<String, String> config = {
  "appTitle": "BUY BUY BUY",
};

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: ProductListPage(),
    );
  }
}

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(config['appTitle']),
        ),
        body: ProductList());
  }
}

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
          return ListView(
              children: snapshot.data
                  ?.map((product) => Container(child: Text(product.name)))
                  ?.toList());
        });
  }
}
