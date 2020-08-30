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
      // setState(() {
      // a = 1 - _scrollController.offset / 472.0.w;
      // });
      // print("a = ${a}");
    });
  }

  @override
  Widget build(BuildContext context) {
    print("100.w = " + 100.w.toString());
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFfcd0bc),
            Color(0xFFf4b3b1),
          ],
        ),
      ),
      child: NestedScrollView(
//        floatHeaderSlivers: true,
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          print("context.size = ${context.widget}");
          return <Widget>[
            SliverAppBar(
              shadowColor: Colors.transparent,
              backgroundColor: Color(0xFFfcd0bc),
              // backgroundColor: Colors.transparent,
              expandedHeight: 472.0.w,
              floating: true,
              stretch: true,
              onStretchTrigger: () {
                print("onStretchTrigger");
                return;
              },
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
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
                title: Text(
                  "XXXX",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ];
        },
        body: Container(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kToolbarHeight),
                    topRight: Radius.circular(kToolbarHeight)),
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
      ),
    );
  }
}
