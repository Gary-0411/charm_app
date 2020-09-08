import 'package:charm_app/model/bilibili/bean/bili_category_list_entity.dart';
import 'package:charm_app/model/bilibili/photo/dio_bili.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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

  EasyRefreshController _controller;

  var fistLoad = true;
  var _curPage = 0;
  List<BiliCategoryListDataItem> listData = List();

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
            // color: Colors.white,
            child: TabBar(
              isScrollable: true,
              onTap: (value) {},
              controller: _tabController,
              tabs: <Widget>[
                Tab(text: "Cosplay"),
                Tab(text: "私服"),
              ],
            ),
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
            onTap: (value) {},
            controller: _tabController,
            tabs: <Widget>[
              Tab(text: "最热"),
              Tab(text: "最新"),
            ],
          ),
          Container(
            height: 1.w,
            color: Colors.grey[400],
          ),
          Expanded(
            child: EasyRefresh(
              firstRefresh: true,
              onRefresh: () async {
                _curPage = 0;
                await DioBili.get<BiliCategoryListEntity>(
                  "Photo/list?category=cos&type=hot&page_num=${_curPage}&page_size=20",
                  onSuccess: (t) {
                    _curPage++;
                    listData.clear();
                    listData.addAll(t.data.items);
                    setState(() {});
                    // print("rsp = ${t.data.length}");
                  },
                  onError: (error) {
                    print("error = $error");
                  },
                );
              },
              behavior: ScrollBehavior(),
              controller: _controller,
              child: _getGrid(),
              onLoad: () async {
                await DioBili.get<BiliCategoryListEntity>(
                  "Photo/list?category=cos&type=hot&page_num=${_curPage + 1}&page_size=20",
                  onSuccess: (t) {
                    _curPage++;
                    listData.addAll(t.data.items);
                    setState(() {});
                    // print("rsp = ${t.data.length}");
                  },
                  onError: (error) {
                    print("error = $error");
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _getGrid() {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 6,
      itemCount: listData.length,
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(24.w),
          child: Container(
            child: Column(
              children: [
                Image.network(
                  listData[index].item.pictures[0].imgSrc + "@832w_832h_1e.webp",
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        listData[index].item.title,
                        maxLines: 1,
                        style: TextStyle(fontSize: 11),
                      ),
                      Row(
                        children: [
                          ClipOval(
                            child: Image.network(
                              listData[index].user.headUrl + "@302w_1e.webp",
                              width: 30,
                              height: 30,
                            ),
                          ),
                          Text(
                            listData[index].user.name,
                            maxLines: 1,
                            style: TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            color: Colors.white,
          ),
        );
      },
      staggeredTileBuilder: (int index) {
        // listData[index].user.name
        var picture = listData[index].item.pictures[0];
        var imgHeight = picture.imgHeight;
        var imgWidth = picture.imgWidth;
        var d = imgHeight / imgWidth * 2;
        print("imgHeight = $imgHeight , imgWidth = $imgWidth , d = $d");
        return StaggeredTile.count(2, d + 0.8);
      },
      mainAxisSpacing: 16.0.w,
      crossAxisSpacing: 16.0.w,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _tabController2.dispose();
    super.dispose();
  }
}
