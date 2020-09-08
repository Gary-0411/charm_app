import 'package:charm_app/model/bilibili/bean/bili_category_list_entity.dart';

biliCategoryListEntityFromJson(BiliCategoryListEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['message'] != null) {
		data.message = json['message']?.toString();
	}
	if (json['data'] != null) {
		data.data = new BiliCategoryListData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> biliCategoryListEntityToJson(BiliCategoryListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['message'] = entity.message;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

biliCategoryListDataFromJson(BiliCategoryListData data, Map<String, dynamic> json) {
	if (json['total_count'] != null) {
		data.totalCount = json['total_count']?.toInt();
	}
	if (json['items'] != null) {
		data.items = new List<BiliCategoryListDataItem>();
		(json['items'] as List).forEach((v) {
			data.items.add(new BiliCategoryListDataItem().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> biliCategoryListDataToJson(BiliCategoryListData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['total_count'] = entity.totalCount;
	if (entity.items != null) {
		data['items'] =  entity.items.map((v) => v.toJson()).toList();
	}
	return data;
}

biliCategoryListDataItemFromJson(BiliCategoryListDataItem data, Map<String, dynamic> json) {
	if (json['user'] != null) {
		data.user = new BiliCategoryListDataItemsUser().fromJson(json['user']);
	}
	if (json['item'] != null) {
		data.item = new BiliCategoryListDataItemsItem().fromJson(json['item']);
	}
	return data;
}

Map<String, dynamic> biliCategoryListDataItemToJson(BiliCategoryListDataItem entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.user != null) {
		data['user'] = entity.user.toJson();
	}
	if (entity.item != null) {
		data['item'] = entity.item.toJson();
	}
	return data;
}

biliCategoryListDataItemsUserFromJson(BiliCategoryListDataItemsUser data, Map<String, dynamic> json) {
	if (json['uid'] != null) {
		data.uid = json['uid']?.toInt();
	}
	if (json['head_url'] != null) {
		data.headUrl = json['head_url']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> biliCategoryListDataItemsUserToJson(BiliCategoryListDataItemsUser entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['uid'] = entity.uid;
	data['head_url'] = entity.headUrl;
	data['name'] = entity.name;
	return data;
}

biliCategoryListDataItemsItemFromJson(BiliCategoryListDataItemsItem data, Map<String, dynamic> json) {
	if (json['doc_id'] != null) {
		data.docId = json['doc_id']?.toInt();
	}
	if (json['poster_uid'] != null) {
		data.posterUid = json['poster_uid']?.toInt();
	}
	if (json['pictures'] != null) {
		data.pictures = new List<BiliCategoryListDataItemsItemPicture>();
		(json['pictures'] as List).forEach((v) {
			data.pictures.add(new BiliCategoryListDataItemsItemPicture().fromJson(v));
		});
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['category'] != null) {
		data.category = json['category']?.toString();
	}
	if (json['upload_time'] != null) {
		data.uploadTime = json['upload_time']?.toInt();
	}
	if (json['already_liked'] != null) {
		data.alreadyLiked = json['already_liked']?.toInt();
	}
	if (json['already_voted'] != null) {
		data.alreadyVoted = json['already_voted']?.toInt();
	}
	return data;
}

Map<String, dynamic> biliCategoryListDataItemsItemToJson(BiliCategoryListDataItemsItem entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['doc_id'] = entity.docId;
	data['poster_uid'] = entity.posterUid;
	if (entity.pictures != null) {
		data['pictures'] =  entity.pictures.map((v) => v.toJson()).toList();
	}
	data['title'] = entity.title;
	data['category'] = entity.category;
	data['upload_time'] = entity.uploadTime;
	data['already_liked'] = entity.alreadyLiked;
	data['already_voted'] = entity.alreadyVoted;
	return data;
}

biliCategoryListDataItemsItemPictureFromJson(BiliCategoryListDataItemsItemPicture data, Map<String, dynamic> json) {
	if (json['img_src'] != null) {
		data.imgSrc = json['img_src']?.toString();
	}
	if (json['img_width'] != null) {
		data.imgWidth = json['img_width']?.toInt();
	}
	if (json['img_height'] != null) {
		data.imgHeight = json['img_height']?.toInt();
	}
	if (json['img_size'] != null) {
		data.imgSize = json['img_size']?.toInt();
	}
	return data;
}

Map<String, dynamic> biliCategoryListDataItemsItemPictureToJson(BiliCategoryListDataItemsItemPicture entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['img_src'] = entity.imgSrc;
	data['img_width'] = entity.imgWidth;
	data['img_height'] = entity.imgHeight;
	data['img_size'] = entity.imgSize;
	return data;
}