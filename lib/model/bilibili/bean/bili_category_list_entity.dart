import 'package:charm_app/generated/json/base/json_convert_content.dart';
import 'package:charm_app/generated/json/base/json_field.dart';

class BiliCategoryListEntity with JsonConvert<BiliCategoryListEntity> {
	int code;
	String msg;
	String message;
	BiliCategoryListData data;
}

class BiliCategoryListData with JsonConvert<BiliCategoryListData> {
	@JSONField(name: "total_count")
	int totalCount;
	List<BiliCategoryListDataItem> items;
}

class BiliCategoryListDataItem with JsonConvert<BiliCategoryListDataItem> {
	BiliCategoryListDataItemsUser user;
	BiliCategoryListDataItemsItem item;
}

class BiliCategoryListDataItemsUser with JsonConvert<BiliCategoryListDataItemsUser> {
	int uid;
	@JSONField(name: "head_url")
	String headUrl;
	String name;
}

class BiliCategoryListDataItemsItem with JsonConvert<BiliCategoryListDataItemsItem> {
	@JSONField(name: "doc_id")
	int docId;
	@JSONField(name: "poster_uid")
	int posterUid;
	List<BiliCategoryListDataItemsItemPicture> pictures;
	String title;
	String category;
	@JSONField(name: "upload_time")
	int uploadTime;
	@JSONField(name: "already_liked")
	int alreadyLiked;
	@JSONField(name: "already_voted")
	int alreadyVoted;
}

class BiliCategoryListDataItemsItemPicture with JsonConvert<BiliCategoryListDataItemsItemPicture> {
	@JSONField(name: "img_src")
	String imgSrc;
	@JSONField(name: "img_width")
	int imgWidth;
	@JSONField(name: "img_height")
	int imgHeight;
	@JSONField(name: "img_size")
	int imgSize;
}
