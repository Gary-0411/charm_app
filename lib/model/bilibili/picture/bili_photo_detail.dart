import 'package:charm_app/model/bilibili/bean/bili_category_list_entity.dart';
import 'package:charm_app/model/bilibili/photo/dio_bili.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BiliPhotoDetailPage extends StatefulWidget {
  final int docId;

  BiliPhotoDetailPage({@required this.docId});

  @override
  State<StatefulWidget> createState() {
    return _BiliPhotoDetailState();
  }
}

class _BiliPhotoDetailState extends State<BiliPhotoDetailPage> {
  int _docId;

  @override
  void initState() {
    super.initState();
    _docId = widget.docId;
    DioBili.get<BiliCategoryListEntity>(
      "https://api.vc.bilibili.com/link_draw/v1/doc/detail?doc_id=${_docId}",
      onSuccess: (t) {},
      onError: (error) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text("data"),
      ),
    );
  }
}
