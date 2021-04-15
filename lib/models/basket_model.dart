import 'package:ecom_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class BasketModel extends ChangeNotifier {
  final List<ProductModel> products;

  BasketModel({
    @required this.products,
  });

  factory BasketModel.fromJson(Map<String, dynamic> json) {
    return BasketModel(
      products: List.from(json['products'] ?? [])
          .map((product) => ProductModel.fromJson(product))
          .toList(),
    );
  }

  void addProduct(ProductModel product) {
    if (product == null) return;
    print(product);
    this.products.add(product);
    notifyListeners();

    assert(this.products.contains(product));
  }

  void removeProduct(String id) {
    if (id == null) return;

    this.products.removeWhere((product) => product.id == id);
    notifyListeners();
  }

  void empty() {
    this.products.removeRange(0, this.products.length);
    notifyListeners();

    assert(this.products.isEmpty);
  }
}
