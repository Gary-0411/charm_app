import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MineMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MineMainState();
  }
}

class MineMainState extends State<MineMainPage> {
  ScrollController _scrollController = ScrollController();

  double a = 1;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      print("${_scrollController.offset}");
    });
  }

  static const double _PADDING_H = kToolbarHeight / 3;

  bool aa = false;

  List<MenuItem> menuList = [
    MenuItem(title: "会员中心", hint: "仅需三秒，9折礼券等你领"),
    MenuItem(title: "我的订单", hint: ""),
    MenuItem(title: "我的拼团", hint: ""),
    MenuItem(title: "消息中心", hint: ""),
    MenuItem(title: "管理地址", hint: ""),
    MenuItem(title: "会员中心", hint: "仅需三秒，9折礼券等你领"),
    MenuItem(title: "我的订单", hint: ""),
    MenuItem(title: "我的拼团", hint: ""),
    MenuItem(title: "消息中心", hint: ""),
    MenuItem(title: "管理地址", hint: ""),
    MenuItem(title: "会员中心", hint: "仅需三秒，9折礼券等你领"),
    MenuItem(title: "我的订单", hint: ""),
    MenuItem(title: "我的拼团", hint: ""),
    MenuItem(title: "消息中心", hint: ""),
    MenuItem(title: "管理地址", hint: ""),
    MenuItem(title: "会员中心", hint: "仅需三秒，9折礼券等你领"),
    MenuItem(title: "我的订单", hint: ""),
    MenuItem(title: "我的拼团", hint: ""),
    MenuItem(title: "消息中心", hint: ""),
    MenuItem(title: "管理地址", hint: ""),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFfcd0bc),
            Color(0xFFf4b3b1),
          ],
        ),
      ),
      child: NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
          } else if (notification is ScrollStartNotification) {
            aa = true;
            print("aa  =============  ${aa}");
          } else if (notification is ScrollEndNotification) {
            var offset = _scrollController.offset;
            if (aa) {
              if (offset < 472.0.w * 0.4) {
//                setState(() {
                _scrollController.animateTo(0.0.w,
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
//                });
                print("offset < 472.0.w");
              } else {
//                setState(() {
//                  _scrollController.jumpTo(470.0.w);
                _scrollController.animateTo(470.0.w,
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
//                });/

                print("offset > 472.0.w");
              }
              aa = false;
            }
//            print("notification = ${notification.metrics.extentBefore}");
//            print("notification = ${notification.metrics.atEdge}");
          } else if (notification is UserScrollNotification) {
          } else if (notification is OverscrollNotification) {
          } else {
//            print("notification = $notification");
          }
          return;
        },
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                shadowColor: Colors.transparent,
                backgroundColor: Color(0xFFfcd0bc),
//                backgroundColor: Colors.transparent,
                expandedHeight: 472.0.w,
                toolbarHeight: 100.w,
                floating: true,
                stretch: true,
                snap: false,
                onStretchTrigger: () {
//                  print("onStretchTrigger");
                  return;
                },
                pinned: true,
                flexibleSpace: LayoutBuilder(builder: (context, snapshot) {
                  double percent = ((snapshot.maxHeight -
                          100.w -
                          ScreenUtil.statusBarHeight) /
                      (472.0.w - 100.w));
//                  print("percent = ${percent}");
                  return SafeArea(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFfcd0bc),
                                Color(0xFFf4b3b1),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 100.w * percent + 14.w, left: _PADDING_H),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(200.w),
                            child: Image.network(
                              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598849708673&di=cffc0ace3b33bbf29bde37eed3161e31&imgtype=0&src=http%3A%2F%2Fdp.gtimg.cn%2Fdiscuzpic%2F0%2Fdiscuz_x5_gamebbs_qq_com_forum_201306_19_1256219xc797y90heepdbh.jpg%2F0",
                              width: 48.w * percent + 72.w,
                              height: 48.w * percent + 72.w,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 60.w * percent + _PADDING_H + 72.w + 12.w,
                            top: 90.w * percent + 20.w,
                          ),
                          child: Text(
                            "拉面小丸子",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.w * percent + 40.w,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 60.w * 1 + _PADDING_H + 72.w + 12.w,
                            top: 188.w + 100000 * (1 - percent) * 0,
                          ),
                          child: Text(
                            "买到0个好物  15个关注  0喜欢",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.w,
                            ),
                          ),
                        ),
                        Padding(
                          child: LinearProgressIndicator(
                            value: 0.5,
                            minHeight: 10,
                            semanticsLabel: "xxaaxa",
//                            valueColor: Colors.red,
                            semanticsValue: "xxxx",
//                            backgroundColor: Colors.blue,
                            // value: 0.2,
                            valueColor:
                                new AlwaysStoppedAnimation<Color>(Colors.red),
                          ),
                          padding: EdgeInsets.only(
                              top: 360.w,
                              left: kToolbarHeight * a / 3,
                              right: kToolbarHeight * a / 3),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: kToolbarHeight * a / 3,
                            top: 400.w,
                          ),
                          child: Text(
                            "再积414经验值可升级",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.w,
                            ),
                          ),
                        ),
                        Align(
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: kToolbarHeight * a / 3,
                              top: 400.w,
                            ),
                            child: Text(
                              "500",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.w,
                              ),
                            ),
                          ),
                          alignment: Alignment.topRight,
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ];
          },
          body: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kToolbarHeight * a / 3),
                  topRight: Radius.circular(kToolbarHeight * a / 3)),
            ),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  height: 120.w,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: _PADDING_H, right: _PADDING_H),
                    child: Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.bookmark_border,
                          size: 56.w,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16.w),
                          child: Text(
                            menuList[index].title,
                            style: TextStyle(
                              fontSize: 36.w,
//                      fontWeight:FontWeight.w700,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              menuList[index].hint,
                              style: TextStyle(
                                fontSize: 28.w,
                                color: Color(0xffd3d3d3),
//                      fontWeight:FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16.w),
                          child: Icon(Icons.arrow_forward_ios),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: menuList.length,
            ),
          ),
        ),
      ),
    );
  }
}

class MenuItem {
  String title;
  String hint;

  MenuItem({this.title, this.hint});
}
