import 'package:charm_app/model/bilibili/bean/rsp_bili_photo_detail_entity.dart';

rspBiliPhotoDetailEntityFromJson(RspBiliPhotoDetailEntity data, Map<String, dynamic> json) {
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
		data.data = new RspBiliPhotoDetailData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> rspBiliPhotoDetailEntityToJson(RspBiliPhotoDetailEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['message'] = entity.message;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

rspBiliPhotoDetailDataFromJson(RspBiliPhotoDetailData data, Map<String, dynamic> json) {
	if (json['user'] != null) {
		data.user = new RspBiliPhotoDetailDataUser().fromJson(json['user']);
	}
	if (json['item'] != null) {
		data.item = new RspBiliPhotoDetailDataItem().fromJson(json['item']);
	}
	return data;
}

Map<String, dynamic> rspBiliPhotoDetailDataToJson(RspBiliPhotoDetailData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.user != null) {
		data['user'] = entity.user.toJson();
	}
	if (entity.item != null) {
		data['item'] = entity.item.toJson();
	}
	return data;
}

rspBiliPhotoDetailDataUserFromJson(RspBiliPhotoDetailDataUser data, Map<String, dynamic> json) {
	if (json['uid'] != null) {
		data.uid = json['uid']?.toInt();
	}
	if (json['head_url'] != null) {
		data.headUrl = json['head_url']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['vip'] != null) {
		data.vip = new RspBiliPhotoDetailDataUserVip().fromJson(json['vip']);
	}
	if (json['upload_count'] != null) {
		data.uploadCount = json['upload_count']?.toInt();
	}
	return data;
}

Map<String, dynamic> rspBiliPhotoDetailDataUserToJson(RspBiliPhotoDetailDataUser entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['uid'] = entity.uid;
	data['head_url'] = entity.headUrl;
	data['name'] = entity.name;
	if (entity.vip != null) {
		data['vip'] = entity.vip.toJson();
	}
	data['upload_count'] = entity.uploadCount;
	return data;
}

rspBiliPhotoDetailDataUserVipFromJson(RspBiliPhotoDetailDataUserVip data, Map<String, dynamic> json) {
	if (json['vipType'] != null) {
		data.vipType = json['vipType']?.toInt();
	}
	if (json['vipDueDate'] != null) {
		data.vipDueDate = json['vipDueDate']?.toInt();
	}
	if (json['dueRemark'] != null) {
		data.dueRemark = json['dueRemark']?.toString();
	}
	if (json['accessStatus'] != null) {
		data.accessStatus = json['accessStatus']?.toInt();
	}
	if (json['vipStatus'] != null) {
		data.vipStatus = json['vipStatus']?.toInt();
	}
	if (json['vipStatusWarn'] != null) {
		data.vipStatusWarn = json['vipStatusWarn']?.toString();
	}
	if (json['themeType'] != null) {
		data.themeType = json['themeType']?.toInt();
	}
	if (json['label'] != null) {
		data.label = new RspBiliPhotoDetailDataUserVipLabel().fromJson(json['label']);
	}
	return data;
}

Map<String, dynamic> rspBiliPhotoDetailDataUserVipToJson(RspBiliPhotoDetailDataUserVip entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['vipType'] = entity.vipType;
	data['vipDueDate'] = entity.vipDueDate;
	data['dueRemark'] = entity.dueRemark;
	data['accessStatus'] = entity.accessStatus;
	data['vipStatus'] = entity.vipStatus;
	data['vipStatusWarn'] = entity.vipStatusWarn;
	data['themeType'] = entity.themeType;
	if (entity.label != null) {
		data['label'] = entity.label.toJson();
	}
	return data;
}

rspBiliPhotoDetailDataUserVipLabelFromJson(RspBiliPhotoDetailDataUserVipLabel data, Map<String, dynamic> json) {
	if (json['path'] != null) {
		data.path = json['path']?.toString();
	}
	return data;
}

Map<String, dynamic> rspBiliPhotoDetailDataUserVipLabelToJson(RspBiliPhotoDetailDataUserVipLabel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['path'] = entity.path;
	return data;
}

rspBiliPhotoDetailDataItemFromJson(RspBiliPhotoDetailDataItem data, Map<String, dynamic> json) {
	if (json['biz'] != null) {
		data.biz = json['biz']?.toInt();
	}
	if (json['doc_id'] != null) {
		data.docId = json['doc_id']?.toInt();
	}
	if (json['poster_uid'] != null) {
		data.posterUid = json['poster_uid']?.toInt();
	}
	if (json['category'] != null) {
		data.category = json['category']?.toString();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toInt();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['tags'] != null) {
		data.tags = new List<RspBiliPhotoDetailDataItemTag>();
		(json['tags'] as List).forEach((v) {
			data.tags.add(new RspBiliPhotoDetailDataItemTag().fromJson(v));
		});
	}
	if (json['pictures'] != null) {
		data.pictures = new List<RspBiliPhotoDetailDataItemPicture>();
		(json['pictures'] as List).forEach((v) {
			data.pictures.add(new RspBiliPhotoDetailDataItemPicture().fromJson(v));
		});
	}
	if (json['source'] != null) {
		data.source = json['source'];
	}
	if (json['upload_time'] != null) {
		data.uploadTime = json['upload_time']?.toString();
	}
	if (json['upload_timestamp'] != null) {
		data.uploadTimestamp = json['upload_timestamp']?.toInt();
	}
	if (json['upload_time_text'] != null) {
		data.uploadTimeText = json['upload_time_text']?.toString();
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	if (json['role'] != null) {
		data.role = json['role'];
	}
	if (json['settings'] != null) {
		data.settings = new RspBiliPhotoDetailDataItemSettings().fromJson(json['settings']);
	}
	if (json['already_collected'] != null) {
		data.alreadyCollected = json['already_collected']?.toInt();
	}
	if (json['already_liked'] != null) {
		data.alreadyLiked = json['already_liked']?.toInt();
	}
	if (json['user_status'] != null) {
		data.userStatus = json['user_status']?.toInt();
	}
	if (json['at_control'] != null) {
		data.atControl = json['at_control']?.toString();
	}
	if (json['view_count'] != null) {
		data.viewCount = json['view_count']?.toInt();
	}
	if (json['like_count'] != null) {
		data.likeCount = json['like_count']?.toInt();
	}
	if (json['collect_count'] != null) {
		data.collectCount = json['collect_count']?.toInt();
	}
	if (json['verify_status'] != null) {
		data.verifyStatus = json['verify_status']?.toInt();
	}
	if (json['already_voted'] != null) {
		data.alreadyVoted = json['already_voted']?.toInt();
	}
	if (json['vote_count'] != null) {
		data.voteCount = json['vote_count']?.toInt();
	}
	if (json['comment_count'] != null) {
		data.commentCount = json['comment_count']?.toInt();
	}
	return data;
}

Map<String, dynamic> rspBiliPhotoDetailDataItemToJson(RspBiliPhotoDetailDataItem entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['biz'] = entity.biz;
	data['doc_id'] = entity.docId;
	data['poster_uid'] = entity.posterUid;
	data['category'] = entity.category;
	data['type'] = entity.type;
	data['title'] = entity.title;
	if (entity.tags != null) {
		data['tags'] =  entity.tags.map((v) => v.toJson()).toList();
	}
	if (entity.pictures != null) {
		data['pictures'] =  entity.pictures.map((v) => v.toJson()).toList();
	}
	data['source'] = entity.source;
	data['upload_time'] = entity.uploadTime;
	data['upload_timestamp'] = entity.uploadTimestamp;
	data['upload_time_text'] = entity.uploadTimeText;
	data['description'] = entity.description;
	data['role'] = entity.role;
	if (entity.settings != null) {
		data['settings'] = entity.settings.toJson();
	}
	data['already_collected'] = entity.alreadyCollected;
	data['already_liked'] = entity.alreadyLiked;
	data['user_status'] = entity.userStatus;
	data['at_control'] = entity.atControl;
	data['view_count'] = entity.viewCount;
	data['like_count'] = entity.likeCount;
	data['collect_count'] = entity.collectCount;
	data['verify_status'] = entity.verifyStatus;
	data['already_voted'] = entity.alreadyVoted;
	data['vote_count'] = entity.voteCount;
	data['comment_count'] = entity.commentCount;
	return data;
}

rspBiliPhotoDetailDataItemTagFromJson(RspBiliPhotoDetailDataItemTag data, Map<String, dynamic> json) {
	if (json['tag'] != null) {
		data.tag = json['tag']?.toString();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toInt();
	}
	if (json['category'] != null) {
		data.category = json['category']?.toString();
	}
	if (json['text'] != null) {
		data.text = json['text']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> rspBiliPhotoDetailDataItemTagToJson(RspBiliPhotoDetailDataItemTag entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['tag'] = entity.tag;
	data['type'] = entity.type;
	data['category'] = entity.category;
	data['text'] = entity.text;
	data['name'] = entity.name;
	return data;
}

rspBiliPhotoDetailDataItemPictureFromJson(RspBiliPhotoDetailDataItemPicture data, Map<String, dynamic> json) {
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

Map<String, dynamic> rspBiliPhotoDetailDataItemPictureToJson(RspBiliPhotoDetailDataItemPicture entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['img_src'] = entity.imgSrc;
	data['img_width'] = entity.imgWidth;
	data['img_height'] = entity.imgHeight;
	data['img_size'] = entity.imgSize;
	return data;
}

rspBiliPhotoDetailDataItemSettingsFromJson(RspBiliPhotoDetailDataItemSettings data, Map<String, dynamic> json) {
	if (json['copy_forbidden'] != null) {
		data.copyForbidden = json['copy_forbidden']?.toInt();
	}
	return data;
}

Map<String, dynamic> rspBiliPhotoDetailDataItemSettingsToJson(RspBiliPhotoDetailDataItemSettings entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['copy_forbidden'] = entity.copyForbidden;
	return data;
}