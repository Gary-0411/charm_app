import 'package:charm_app/model/bilibili/bean/bili_category_list_entity.dart';
import 'package:charm_app/model/bilibili/picture/bili_photo_detail.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BiliPictureCard extends StatelessWidget {
  final BiliCategoryListDataItem data;

  BiliPictureCard(this.data);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.w),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return BiliPhotoDetailPage(
              docId: data.item.docId,
              title: data.item.title,
            );
          })).then((value) {});
        },
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  // color: Colors.red,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ExtendedImage.network(
                          data.item.pictures[0].imgSrc +
                              "@${400}w_${400}h_1e.webp",
                          fit: BoxFit.cover,
                          cache: true,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          margin: EdgeInsets.only(right: 10.w, bottom: 4.w),
                          decoration: BoxDecoration(
                            color: const Color(0x99333333),
                            borderRadius: BorderRadius.circular(8.w),
                          ),
                          padding: EdgeInsets.fromLTRB(10.w, 4.w, 10.w, 4.w),
                          child: Text(
                            "${data.item.pictures.length}P",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.item.title,
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
                            data.user.headUrl +
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
                            data.user.name,
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
