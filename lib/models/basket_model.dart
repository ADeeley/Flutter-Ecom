import 'package:ecom_app/models/product_model.dart';
import 'package:flutter/material.dart';

class BasketModel {
  final List<ProductModel> products;

  BasketModel({
    @required this.products,
  });

  factory BasketModel.fromJson(Map<String, dynamic> json) {
    return BasketModel(
      products: json['products'],
    );
  }
}
