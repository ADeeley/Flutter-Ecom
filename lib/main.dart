import 'package:flutter/material.dart';

// Contains constants for the app
// TODO: AD should be extracted into enums and external config
Map<String, String> config = {
  "appTitle": "BUY BUY BUY",
};

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: ProductListPage(),
    );
  }
}

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(config['appTitle']),
      ),
    );
  }
}
