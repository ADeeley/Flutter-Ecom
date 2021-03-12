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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: MainAppBar(),
      body: SlidingUpPanel(
        minHeight: 100,
        panel: Column(
          children: [
            Icon(Icons.drag_handle_rounded),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SlidingActionButton(
                    text: Text('SAVE'), icon: Icon(Icons.favorite_outline)),
                SlidingActionButton(
                    text: Text('SIZE GUIDE'), icon: Icon(Icons.circle)),
                SlidingActionButton(
                    text: Text('SHARE'), icon: Icon(Icons.share_outlined)),
              ],
            )
          ],
        ),
        body: Center(child: ProductDisplay(data)),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: MainBottomNavigationBar(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {},
        label: Text('ADD'),
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
    );
  }

  Color getBackgroundColor(Set<MaterialState> states) {
    return Colors.grey;
  }
}

class SlidingActionButton extends StatelessWidget {
  final text;
  final icon;

  const SlidingActionButton({
    Key key,
    Text this.text,
    Icon this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => {},
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: icon,
            ),
            text,
          ],
        ));
  }
}
