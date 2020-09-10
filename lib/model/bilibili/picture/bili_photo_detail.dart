import 'package:charm_app/model/bilibili/bean/rsp_bili_photo_detail_entity.dart';
import 'package:charm_app/model/bilibili/photo/dio_bili.dart';
import 'package:charm_app/model/common/image_preview_page.dart';
import 'package:extended_image/extended_image.dart';
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
    var w = ScreenUtil.screenWidthPx - 16 * 2;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: EdgeInsets.all(16.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  _getList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getList() {
    if (data == null) {
      return [];
    } else {
      return [
        Column(
          children: [
            _getUser(),
            _getPhoto(),
          ],
        )
      ];
    }
  }

  Widget _getUser() {
    return Text(data.user.toJson().toString());
  }

  Widget _getPhoto() {
    var map = data.item.pictures.map((e) {
      var w = (ScreenUtil.screenWidth - 32);
      var h = ((e.imgHeight / e.imgWidth) * w);
      print("w = $w , h = $h");
      return Container(
        padding: EdgeInsets.only(top: 10.w),
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                TransparentMaterialPageRoute(builder: (BuildContext context) {
              List<String> map = data.item.pictures.map((e) => e.imgSrc).toList();
              return ImagePreviewPage(
                list: map,
                index:data.item.pictures.indexOf(e),
              );
            })).then((value) {});
          },
          child: ExtendedImage.network(
            e.imgSrc + "@${w.toInt()}w_${w.toInt()}h_1e.webp",
            width: w,
            height: h,
            cache: true,
          ),
        ),
      );
    });
    var list = map.toList();
    return Column(
      children: list,
    );
  }
}
