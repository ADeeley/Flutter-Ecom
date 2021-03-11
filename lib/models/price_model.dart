import 'package:flutter/material.dart';
import 'package:money2/money2.dart';

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

  static String getPrice(PriceModel price) {
    return Money.fromInt(
      (double.parse(price.amount) * 100).toInt(), // Funky stuff to get an int
      Currency.create(price.currency, 2),
    ).toString();
  }
}
