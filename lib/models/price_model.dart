import 'package:flutter/material.dart';

class PriceModel {
  final String amount;
  final String currency;

  PriceModel({
    @required this.amount,
    @required this.currency,
  });

  factory PriceModel.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    return PriceModel(
      amount: json['amount'],
      currency: json['currency'],
    );
  }
}
