import 'package:charm_app/model/main/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[200],
        primaryColor: Colors.cyan,
        accentColor: Colors.cyan[500],
        backgroundColor: Colors.redAccent,
      ),
      home: MainPage(),
    );
  }
}
