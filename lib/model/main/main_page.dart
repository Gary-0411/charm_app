import 'package:charm_app/model/bilibili/picture/bili_picture_area_page.dart';
import 'package:charm_app/model/mine/mine_main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  var index = 0;

  var a = Object();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 360, height: 640);
    return Scaffold(
      // appBar: AppBar(title: Text("xxxx"),),
      body: IndexedStack(
        index: index,
        children: [
          BiliPictureAreaPage(),
          MineMainPage(),
          MineMainPage(),
          MineMainPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        // selectedItemColor: Colors.red,
        // unselectedItemColor: Colors.grey[400],
        showUnselectedLabels: true,
        onTap: (value) => setState(() => index = value),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.view_quilt),
            label: "相蒲",
          ),
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
