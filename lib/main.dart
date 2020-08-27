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
      theme: ThemeData(),
      home: MaterialApp(
        theme: ThemeData(),
        home: Scaffold(
//          appBar: AppBar(title: Text("XXX")),
          body: MainPage(),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.view_quilt),
                label: "干货",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.android),
                label: "玩安卓",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_box),
                label: "个人中心",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
