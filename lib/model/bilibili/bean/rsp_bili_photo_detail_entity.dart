import 'package:charm_app/generated/json/base/json_convert_content.dart';
import 'package:charm_app/generated/json/base/json_field.dart';

class RspBiliPhotoDetailEntity with JsonConvert<RspBiliPhotoDetailEntity> {
  int code;
  String msg;
  String message;
  RspBiliPhotoDetailData data;
}

class RspBiliPhotoDetailData with JsonConvert<RspBiliPhotoDetailData> {
  RspBiliPhotoDetailDataUser user;
  RspBiliPhotoDetailDataItem item;
}

class RspBiliPhotoDetailDataUser with JsonConvert<RspBiliPhotoDetailDataUser> {
  int uid;
  @JSONField(name: "head_url")
  String headUrl;
  String name;
  RspBiliPhotoDetailDataUserVip vip;
  @JSONField(name: "upload_count")
  int uploadCount;
}

class RspBiliPhotoDetailDataUserVip
    with JsonConvert<RspBiliPhotoDetailDataUserVip> {
  int vipType;
  int vipDueDate;
  String dueRemark;
  int accessStatus;
  int vipStatus;
  String vipStatusWarn;
  int themeType;
  RspBiliPhotoDetailDataUserVipLabel label;
}

class RspBiliPhotoDetailDataUserVipLabel
    with JsonConvert<RspBiliPhotoDetailDataUserVipLabel> {
  String path;
}

class RspBiliPhotoDetailDataItem with JsonConvert<RspBiliPhotoDetailDataItem> {
  int biz;
  @JSONField(name: "doc_id")
  int docId;
  @JSONField(name: "poster_uid")
  int posterUid;
  String category;
  int type;
  String title;
  List<RspBiliPhotoDetailDataItemTag> tags;
  List<RspBiliPhotoDetailDataItemPicture> pictures;
  dynamic source;
  @JSONField(name: "upload_time")
  String uploadTime;
  @JSONField(name: "upload_timestamp")
  int uploadTimestamp;
  @JSONField(name: "upload_time_text")
  String uploadTimeText;
  String description;
  dynamic role;
  RspBiliPhotoDetailDataItemSettings settings;
  @JSONField(name: "already_collected")
  int alreadyCollected;
  @JSONField(name: "already_liked")
  int alreadyLiked;
  @JSONField(name: "user_status")
  int userStatus;
  @JSONField(name: "at_control")
  String atControl;
  @JSONField(name: "view_count")
  int viewCount;
  @JSONField(name: "like_count")
  int likeCount;
  @JSONField(name: "collect_count")
  int collectCount;
  @JSONField(name: "verify_status")
  int verifyStatus;
  @JSONField(name: "already_voted")
  int alreadyVoted;
  @JSONField(name: "vote_count")
  int voteCount;
  @JSONField(name: "comment_count")
  int commentCount;
}

class RspBiliPhotoDetailDataItemTag
    with JsonConvert<RspBiliPhotoDetailDataItemTag> {
  String tag;
  int type;
  String category;
  String text;
  String name;
}

class RspBiliPhotoDetailDataItemPicture
    with JsonConvert<RspBiliPhotoDetailDataItemPicture> {
  @JSONField(name: "img_src")
  String imgSrc;
  @JSONField(name: "img_width")
  int imgWidth;
  @JSONField(name: "img_height")
  int imgHeight;
  @JSONField(name: "img_size")
  int imgSize;
}

class RspBiliPhotoDetailDataItemSettings
    with JsonConvert<RspBiliPhotoDetailDataItemSettings> {
  @JSONField(name: "copy_forbidden")
  int copyForbidden;
}
