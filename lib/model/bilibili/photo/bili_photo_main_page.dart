import 'package:charm_app/model/bilibili/bean/bili_category_list_entity.dart';
import 'package:charm_app/model/bilibili/photo/dio_bili.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BiliPhotoMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BiliPhotoMainState();
  }
}

class BiliPhotoMainState extends State<BiliPhotoMainPage> {
  EasyRefreshController _controller;

  var fistLoad = true;
  var _curPage = 0;
  List<BiliCategoryListDataItem> listData = List();

  Widget _getGrid() {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: listData.length,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0)
          return Container(
              // color: Colors.red,
              );
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24.w)),
            image: DecorationImage(
              image: NetworkImage(
                listData[index].user.headUrl,
              ),
            ),
          ),
          child: Text(listData[index].user.name),
        );
      },
      staggeredTileBuilder: (int index) {
        // listData[index].user.name
        return new StaggeredTile.count(2, index == 0 ? 1 : 2);
      },
      mainAxisSpacing: 16.0.w,
      crossAxisSpacing: 16.0.w,
    );
  }

  @override
  void initState() {
    super.initState();
    // print("initState");
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
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
    );
  }
}
