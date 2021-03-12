import 'package:ecom_app/models/product_model.dart';
import 'package:ecom_app/widgets/layout/main_app_bar.dart';
import 'package:ecom_app/widgets/layout/main_bottom_navigation_bar.dart';
import 'package:ecom_app/widgets/product_display.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ProductDisplayPage extends StatelessWidget {
  ProductModel data;

  ProductDisplayPage(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: SlidingUpPanel(
        minHeight: 80,
        panel: Column(
          children: [
            Icon(Icons.drag_handle_rounded),
            TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.green,
                  minimumSize:
                      Size(MediaQuery.of(context).size.width - 40, 45)),
              onPressed: () => {},
              child: Text('ADD'),
            ),
          ],
        ),
        body: Center(child: ProductDisplay(data)),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: MainBottomNavigationBar(),
    );
  }

  Color getBackgroundColor(Set<MaterialState> states) {
    return Colors.grey;
  }
}
