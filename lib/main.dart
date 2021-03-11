import 'package:dio/dio.dart';
import 'package:ecom_app/models/product_model.dart';
import 'package:ecom_app/services/products_service.dart';
import 'package:flutter/material.dart';

// Contains constants for the app
// TODO: AD should be extracted into enums and external config
Map<String, String> config = {
  "appTitle": "TRAINER CENTRAL",
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
        primarySwatch: Colors.lightBlue,
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
        title: Text(config['appTitle'],
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'Helvetica')),
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              Icons.toc_sharp,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: ProductList(),
      backgroundColor: Colors.white,
    );
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
            (productData) => new Product(data: productData),
          )
          .toList();
    } else /* display loading text */ {
      return [Text('Loading...')];
    }
  }
}

class Product extends StatelessWidget {
  final ProductModel data;
  const Product({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Image.network(data.mainImage),
          Text(
            data.name,
            style: TextStyle(fontSize: 16),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              '£${data.price.amount}', // Add method in pricing model to return formatted currency (can flutter do this with a currency widget???)
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            'Sizes in stock:',
            style: TextStyle(color: Colors.green),
          ),
          Text(
            '${data.sizes.join(',')}',
            style: TextStyle(color: Colors.green),
          ),
        ],
      ),
    );
  }
}
