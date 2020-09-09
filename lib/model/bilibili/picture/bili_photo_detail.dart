import 'package:charm_app/model/bilibili/bean/rsp_bili_photo_detail_entity.dart';
import 'package:charm_app/model/bilibili/photo/dio_bili.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BiliPhotoDetailPage extends StatefulWidget {
  final int docId;

  final String title;

  BiliPhotoDetailPage({@required this.docId, @required this.title});

  @override
  State<StatefulWidget> createState() {
    return _BiliPhotoDetailState();
  }
}

class _BiliPhotoDetailState extends State<BiliPhotoDetailPage> {
  int _docId;
  RspBiliPhotoDetailData data;

  @override
  void initState() {
    super.initState();
    _docId = widget.docId;
    DioBili.get<RspBiliPhotoDetailEntity>(
      "https://api.vc.bilibili.com/link_draw/v1/doc/detail?doc_id=${_docId}",
      onSuccess: (t) {
        data = t.data;
        var biz = data.item.biz;
        print("biz = $biz");
        setState(() {});
      },
      onError: (error) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title + widget.title),
      ),
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: EdgeInsets.all(16.0.w),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    Text(data?.item?.description ?? ""),
                    Container(
                      height: 60.w,
                      color: Colors.cyan[100],
                      child: const Text('A'),
                    ),
                    Container(
                      height: 60.w,
                      color: Colors.cyan[100],
                      child: const Text('A'),
                    ),
                    Container(
                      height: 60.w,
                      color: Colors.cyan[100],
                      child: const Text('A'),
                    ),
                    Container(
                      height: 60.w,
                      color: Colors.cyan[100],
                      child: const Text('A'),
                    ),
                    Container(
                      height: 60.w,
                      color: Colors.cyan[100],
                      child: const Text('A'),
                    ),
                    Container(
                      height: 60.w,
                      color: Colors.cyan[100],
                      child: const Text('A'),
                    ),
                    Container(
                      height: 60.w,
                      color: Colors.cyan[100],
                      child: const Text('A'),
                    ),
                    Container(
                      height: 60.w,
                      color: Colors.cyan[100],
                      child: const Text('A'),
                    ),
                    Container(
                      height: 60.w,
                      color: Colors.cyan[100],
                      child: const Text('A'),
                    ),
                    Container(
                      height: 60.w,
                      color: Colors.cyan[100],
                      child: const Text('A'),
                    ),
                    Container(
                      height: 60.w,
                      color: Colors.cyan[100],
                      child: const Text('A'),
                    ),
                    Container(
                      height: 60.w,
                      color: Colors.cyan[100],
                      child: const Text('A'),
                    ),
                    Container(
                      height: 60.w,
                      color: Colors.cyan[100],
                      child: const Text('A'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
