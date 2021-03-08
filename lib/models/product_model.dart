import 'package:flutter/material.dart';

class ProductModel {
  final String id;
  final String sku;
  final String name;
  final String brandName;
  final String mainImage;
  final Map<String, String> price;
  final List<String> sizes;
  final String stockStatus;
  final String colour;
  final String description;

  ProductModel({
    @required this.id,
    @required this.sku,
    @required this.name,
    @required this.brandName,
    @required this.mainImage,
    @required this.price,
    @required this.sizes,
    @required this.stockStatus,
    @required this.colour,
    @required this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      sku: json['SKU'],
      name: json['name'],
      brandName: json['brandName'],
      mainImage: json['mainImage'],
      price: json['price'],
      sizes: json['sizes'],
      stockStatus: json['stockStatus'],
      colour: json['colour'],
      description: json['description'],
    );
  }
}
