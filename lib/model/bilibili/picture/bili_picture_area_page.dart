import 'package:charm_app/model/bilibili/bean/bili_category_list_entity.dart';
import 'package:charm_app/model/bilibili/picture/widget/bili_photo_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BiliPictureAreaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BiliPictureAreaState();
  }
}

class BiliPictureAreaState extends State<BiliPictureAreaPage>
    with TickerProviderStateMixin {
  TabController _tabController;
  TabController _tabController2;

  List<String> tabTitles = [
    "Cosplay",
    "私服",
  ];

  var sa = PhotoList("cos", "new");

  var fistLoad = true;

  List<BiliCategoryListDataItem> listData = List();

  var _listController = ListController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController2 = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            width: ScreenUtil.screenWidthPx,
            color: Colors.white,
            child: Column(
              children: [
                TabBar(
                  isScrollable: true,
                  onTap: (value) {
                    switch (value) {
                      case 0:
                        sa.category = "cos";
                        _listController.changePhotoList(sa);
                        break;
                      case 1:
                        sa.category = "sifu";
                        _listController.changePhotoList(sa);
                        break;
                    }
                  },
                  controller: _tabController,
                  tabs: <Widget>[
                    Tab(text: "Cosplay"),
                    Tab(text: "私服"),
                  ],
                ),
                TabBar(
                  labelStyle: TextStyle(fontWeight: FontWeight.w700),
                  labelColor: const Color(0xff333333),
                  unselectedLabelColor: const Color(0xff999999),
                  unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
                  isScrollable: true,
                  indicatorColor: Colors.purple[100],
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 4.0.w,
                  // indicator: UnderlineTabIndicator(),
                  onTap: (value) {
                    switch (value) {
                      case 0:
                        sa.type = "hot";
                        _listController.changePhotoList(sa);
                        break;
                      case 1:
                        sa.type = "new";
                        _listController.changePhotoList(sa);
                        break;
                    }
                  },
                  controller: _tabController2,
                  tabs: <Widget>[
                    Tab(text: "最热"),
                    Tab(text: "最新"),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 1.w,
            color: Colors.grey[400],
          ),
          BiliPhotoListPage(
            photoList: sa,
            listController: _listController,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _tabController2.dispose();
    super.dispose();
  }
}
