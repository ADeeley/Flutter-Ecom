import 'package:ecom_app/assets/config/config.dart';
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
            crossAxisCount: int.parse(config['productGridColumnCount']),
            clipBehavior: Clip.hardEdge,
            padding: EdgeInsets.all(8), // Padding around the list
            children: _listItems(snapshot),
          );
        });
  }

  List<Widget> _listItems(AsyncSnapshot<List<ProductModel>> snapshot) {
    if (snapshot.data != null) {
      return snapshot.data
          .map((productData) => Container(
                clipBehavior: Clip.hardEdge,
                decoration: _elementDivider(
                  snapshot.data,
                  snapshot.data.indexOf(productData),
                  int.parse(config['productGridColumnCount']),
                ),
                child: GestureDetector(
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
              ))
          .toList();
    } else /* display loading text */ {
      return [Text('Loading...')];
    }
  }

  /// Provides a dividing line between rows of elements
  /// Wraps around a child element of a GridView or similar
  /// TODO: AD, Add tests
  BoxDecoration _elementDivider<T>(
    List<T> elements,
    int elementIndex,
    int crossAxisCount,
  ) {
    final trailing = crossAxisCount -
        (elements.length % crossAxisCount); // don't apply to trailing elements

    final shouldApply = elementIndex < elements.length - trailing;

    return BoxDecoration(
      border: shouldApply
          ? Border(bottom: BorderSide(width: 1, color: Colors.grey.shade300))
          : null,
    );
  }
}
