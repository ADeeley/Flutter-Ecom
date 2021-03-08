import 'package:flutter/material.dart';

class PriceModel {
  final String amount;
  final String currency;

  PriceModel({
    @required this.amount,
    @required this.currency,
  });

  factory PriceModel.fromJson(Map<String, dynamic> json) {
    return PriceModel(
      amount: json['amount'],
      currency: json['currency'],
    );
  }
}
