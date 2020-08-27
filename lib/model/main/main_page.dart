import 'package:charm_app/model/gan/gan_main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: [
          GanMainPage(),
          Container(
            color: Colors.lightBlue[200],
          ),
          Container(
            color: Colors.teal[200],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) => setState(() => index = value),
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
    );
  }
}
