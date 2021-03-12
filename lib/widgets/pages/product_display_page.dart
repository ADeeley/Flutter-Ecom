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
                TextButton(
                    onPressed: () => {},
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Icon(Icons.favorite_outline),
                        ),
                        Text('SAVE'),
                      ],
                    )),
                TextButton(
                    onPressed: () => {},
                    child: Row(
                      children: [
                        Icon(Icons.category),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Text('SIZE GUIDE'),
                        ),
                      ],
                    )),
                TextButton(
                    onPressed: () => {},
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Icon(Icons.share_outlined),
                        ),
                        Text('SHARE'),
                      ],
                    )),
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

// TextButton(
//   style: TextButton.styleFrom(
//       primary: Colors.white,
//       backgroundColor: Colors.green,
//       minimumSize:
//           Size(MediaQuery.of(context).size.width - 40, 45)),
//   onPressed: () => {},
//   child: Text('ADD'),
// ),
