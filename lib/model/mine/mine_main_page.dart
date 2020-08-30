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
    });
  }

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
          } else if (notification is ScrollEndNotification) {
            print("notification = ${notification.metrics.extentBefore}");
            print("notification = ${notification.metrics.atEdge}");
          } else if (notification is UserScrollNotification) {
          } else if (notification is OverscrollNotification) {
          } else {
            print("notification = $notification");
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
                // backgroundColor: Colors.transparent,
                expandedHeight: 472.0.w,
                floating: false,
                stretch: true,
                snap: false,
                onStretchTrigger: () {
                  print("onStretchTrigger");
                  return;
                },
                pinned: true,
                flexibleSpace: LayoutBuilder(builder: (context, snapshot) {
                  double percent = ((snapshot.maxHeight - kToolbarHeight) /
                      (472.0.w - kToolbarHeight));
                  double percenta = 1 - percent;
                  return FlexibleSpaceBar(
                    collapseMode: CollapseMode.none,
                    background: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFfcd0bc),
                            Color(0xFFf4b3b1),
                          ],
                        ),
                      ),
                    ),
                    centerTitle: false,
                    stretchModes: [StretchMode.fadeTitle],
                    titlePadding: EdgeInsets.only(left: 56,bottom: 300.w * percent+16),
                    title: Visibility(
                      visible: true,
                      child: Text(
                        "拉面小丸子",
                        style: TextStyle(color: Colors.white),
                      ),
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
                  topLeft: Radius.circular(kToolbarHeight * a),
                  topRight: Radius.circular(kToolbarHeight * a)),
            ),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.android),
                  title: Text('Gay里Gay气的标题+$index'),
                );
              },
              itemCount: 35,
            ),
          ),
        ),
      ),
    );
  }
}
