import 'package:ecom_app/widgets/layout/main_app_bar.dart';
import 'package:flutter/material.dart';

import 'basket.dart';

class BasketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Basket(),
    );
  }
}
