import 'package:charm_app/model/bilibili/bean/bili_category_list_entity.dart';
import 'package:charm_app/model/bilibili/photo/dio_bili.dart';
import 'package:charm_app/model/bilibili/picture/widget/bili_picture_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BiliPhotoListPage extends StatefulWidget {
  final PhotoList photoList;
  final ListController listController;

  const BiliPhotoListPage({
    Key key,
    @required this.photoList,
    this.listController,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BiliPhotoListState();
  }
}

class PhotoList {
  String category = "";
  String type = "";

  PhotoList(this.category, this.type);
}

class _BiliPhotoListState extends State<BiliPhotoListPage> {
  EasyRefreshController _controller;
  PhotoList photoList;
  var fistLoad = true;
  var _curPage = 0;
  var screenWidthPx = 0.0;
  var _mainAxisSpacing = 16.0.w;
  var _crossAxisSpacing = 16.0.w;
  var _ccc = 16.0;
  var _width = 0.0.w;

  List<BiliCategoryListDataItem> listData = List();

  @override
  void initState() {
    super.initState();
    photoList = widget.photoList;
    if (widget.listController != null) {
      widget.listController._bindEasyRefreshState(this);
    }
    screenWidthPx = ScreenUtil.screenWidthPx;
    _controller = EasyRefreshController();
    _mainAxisSpacing = 8.0.w;
    _crossAxisSpacing = 8.0.w;
    _width = (screenWidthPx - _crossAxisSpacing * 2) / 3;
    _ccc = _width / screenWidthPx * 6;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: EasyRefresh(
        topBouncing: false,
        firstRefresh: true,
        header: MaterialHeader(),
        footer: MaterialFooter(),
        onRefresh: () async {
          _curPage = 0;
          await DioBili.get<BiliCategoryListEntity>(
            "Photo/list?category=${photoList.category}&type=${photoList.type}&page_num=${_curPage}&page_size=20",
            onSuccess: (t) {
              _curPage++;
              listData.clear();
              listData.addAll(t.data.items);
              setState(() {});
              // print("rsp = ${t.data.length}");
            },
            onError: (error) {
              _controller.finishLoad(success: false, noMore: false);
              setState(() {});
              print("error = $error");
            },
          );
        },
        behavior: ScrollBehavior(),
        controller: _controller,
        child: _getGrid(),
        onLoad: () async {
          await DioBili.get<BiliCategoryListEntity>(
            "Photo/list?category=cos&type=hot&page_num=${_curPage + 1}&page_size=30",
            onSuccess: (t) {
              _curPage++;
              listData.addAll(t.data.items);
              if (listData.length >= t.data.totalCount) {
                print(
                    "_controller.finishLoad( _controller.finishLoad(_controller.finishLoad(_controller.finishLoad(_controller.finishLoad(");
                _controller.finishLoad(success: true, noMore: true);
              }
              // else {
              //   _controller.finishLoad(success: true, noMore: false);
              // }
              setState(() {});
              // print("rsp = ${t.data.length}");
            },
            onError: (error) {
              _controller.finishLoad(success: false, noMore: false);
              setState(() {});
              print("error = $error");
            },
          );
        },
      ),
    );
  }

  Widget _getGrid() {
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.all(8.w),
      crossAxisCount: 4,
      itemCount: listData.length,
      itemBuilder: (BuildContext context, int index) {
        return BiliPictureCard(listData[index]);
      },
      staggeredTileBuilder: (int index) {
        // listData[index].user.name
        var picture = listData[index].item.pictures[0];
        var imgHeight = picture.imgHeight;
        var imgWidth = picture.imgWidth;
        if (imgHeight == null) {
          print("imgHeight == null , ${picture.toJson()} ");
        }
        var d = (imgHeight ?? 1) / (imgWidth ?? 1) * _ccc;
        return StaggeredTile.count(2, d + 1);
      },
      mainAxisSpacing: _mainAxisSpacing,
      crossAxisSpacing: _crossAxisSpacing,
    );
  }

  void callRefresh({Duration duration}) {
    _controller.callRefresh(duration: duration);
  }

  void callLoad({Duration duration}) {
    _controller.callLoad(duration: duration);
  }
}

class ListController {
  void changePhotoList(PhotoList photoList) {
    if (this._easyRefreshState != null) {
      this._easyRefreshState.photoList = photoList;
      callRefresh();
    }
  }

  /// 触发刷新
  void callRefresh({Duration duration = const Duration(milliseconds: 300)}) {
    print("callRefresh");
    if (this._easyRefreshState != null) {
      this._easyRefreshState.callRefresh(duration: duration);
    }
  }

  // 状态
  _BiliPhotoListState _easyRefreshState;

  // 绑定状态
  void _bindEasyRefreshState(_BiliPhotoListState state) {
    this._easyRefreshState = state;
  }

  void dispose() {
    this._easyRefreshState = null;
  }
}
