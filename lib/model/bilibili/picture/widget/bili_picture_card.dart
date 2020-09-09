import 'package:charm_app/model/bilibili/bean/bili_category_list_entity.dart';
import 'package:charm_app/model/bilibili/picture/bili_photo_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BiliPictureCard extends StatelessWidget {
  final BiliCategoryListDataItem item;

  BiliPictureCard(this.item);

  @override
  Widget build(BuildContext context) {
    var d = ScreenUtil.screenWidthPx ~/ 2;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.w),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return BiliPhotoDetailPage(
              docId: item.item.docId,
              title: item.item.title,
            );
          })).then((value) {});
        },
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  item.item.pictures[0].imgSrc + "@${d}w_${d}h_1e.webp",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.item.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff333333),
                      ),
                    ),
                    SizedBox(
                      height: 4.w,
                    ),
                    Row(
                      children: [
                        ClipOval(
                          child: Image.network(
                            item.user.headUrl +
                                "@${32.w.toInt()}w_${32.w.toInt()}h_1e.webp",
                            width: 32.w,
                            height: 32.w,
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Expanded(
                          child: Text(
                            item.user.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Color(0xff666666),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.thumb_up_outlined,
                          color: Color(0xff999999),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
