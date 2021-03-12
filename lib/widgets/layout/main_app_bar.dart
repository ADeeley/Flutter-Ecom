import 'package:ecom_app/assets/config/config.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    Key key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: AppBar(
        title: Text(
          config['appTitle'],
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Helvetica',
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              Icons.toc_sharp,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
