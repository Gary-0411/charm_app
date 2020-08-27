import 'package:charm_app/model/main/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
//        colorScheme: ColorScheme(
//          primary: Colors.cyan[100],
//          primaryVariant: Colors.cyan[200],
//          secondary: Colors.cyan[300],
//          secondaryVariant: Colors.cyan[400],
//          surface: Colors.cyan[500],
//          background: Colors.cyan[600],
//          error: Colors.cyan[700],
//          onPrimary: Colors.cyan[800],
//          onSecondary: Colors.cyan[900],
//          onSurface: Colors.cyanAccent[100],
//          onBackground: Colors.cyanAccent[200],
//          onError: Colors.cyanAccent[400],
//          brightness: Brightness.dark,
//        ),
//        primarySwatch: Colors.cyan,
//        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MaterialApp(
        theme: ThemeData(),
        home: Scaffold(
          appBar: AppBar(),
          body: MainPage(),
          bottomNavigationBar: BottomNavigationBar(
//            backgroundColor: Colors.cyan[500],
//            selectedItemColor: Colors.white,
//            showUnselectedLabels: true,
//            unselectedItemColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.ac_unit),
                label: "干货",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.ac_unit),
                label: "玩安卓",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
