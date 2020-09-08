import 'package:charm_app/model/gan/gank_category_bean_entity.dart';
import 'package:charm_app/model/gan/dio_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GanMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GanMainState();
  }
}

class GanMainState extends State<GanMainPage> {
  EasyRefreshController _controller;

  var fistLoad = true;
  var _curPage = 0;
  List<GankCategoryBean> listData = List();

  Widget _getGrid() {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: listData.length,
      itemBuilder: (BuildContext context, int index) => new Container(
        color: Colors.green,
        child: Expanded(
          child: new Image.network(
            listData[index].images[0],
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index == 0 ? 4 : 1.5),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
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
        await DioGan.get<GankCategoryListBean>(
          "data/category/Girl/type/Girl/page/1/count/20",
          onSuccess: (t) {
            _curPage = t.page;
            listData.clear();
            listData.addAll(t.data);
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
        await DioGan.get<GankCategoryListBean>(
          "data/category/Girl/type/Girl/page/${_curPage + 1}/count/20",
          onSuccess: (t) {
            _curPage = t.page;
            listData.addAll(t.data);
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
