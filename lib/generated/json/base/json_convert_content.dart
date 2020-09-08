// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:charm_app/model/bilibili/bean/bili_category_list_entity.dart';
import 'package:charm_app/generated/json/bili_category_list_entity_helper.dart';
import 'package:charm_app/model/gan/gank_category_bean_entity.dart';
import 'package:charm_app/generated/json/gank_category_bean_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {			case BiliCategoryListEntity:
			return biliCategoryListEntityFromJson(data as BiliCategoryListEntity, json) as T;			case BiliCategoryListData:
			return biliCategoryListDataFromJson(data as BiliCategoryListData, json) as T;			case BiliCategoryListDataItem:
			return biliCategoryListDataItemFromJson(data as BiliCategoryListDataItem, json) as T;			case BiliCategoryListDataItemsUser:
			return biliCategoryListDataItemsUserFromJson(data as BiliCategoryListDataItemsUser, json) as T;			case BiliCategoryListDataItemsItem:
			return biliCategoryListDataItemsItemFromJson(data as BiliCategoryListDataItemsItem, json) as T;			case BiliCategoryListDataItemsItemPicture:
			return biliCategoryListDataItemsItemPictureFromJson(data as BiliCategoryListDataItemsItemPicture, json) as T;			case GankCategoryListBean:
			return gankCategoryListBeanFromJson(data as GankCategoryListBean, json) as T;			case GankCategoryBean:
			return gankCategoryBeanFromJson(data as GankCategoryBean, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {			case BiliCategoryListEntity:
			return biliCategoryListEntityToJson(data as BiliCategoryListEntity);			case BiliCategoryListData:
			return biliCategoryListDataToJson(data as BiliCategoryListData);			case BiliCategoryListDataItem:
			return biliCategoryListDataItemToJson(data as BiliCategoryListDataItem);			case BiliCategoryListDataItemsUser:
			return biliCategoryListDataItemsUserToJson(data as BiliCategoryListDataItemsUser);			case BiliCategoryListDataItemsItem:
			return biliCategoryListDataItemsItemToJson(data as BiliCategoryListDataItemsItem);			case BiliCategoryListDataItemsItemPicture:
			return biliCategoryListDataItemsItemPictureToJson(data as BiliCategoryListDataItemsItemPicture);			case GankCategoryListBean:
			return gankCategoryListBeanToJson(data as GankCategoryListBean);			case GankCategoryBean:
			return gankCategoryBeanToJson(data as GankCategoryBean);    }
    return data as T;
  }
  //Go back to a single instance by type
  static _fromJsonSingle(String type, json) {
    switch (type) {			case 'BiliCategoryListEntity':
			return BiliCategoryListEntity().fromJson(json);			case 'BiliCategoryListData':
			return BiliCategoryListData().fromJson(json);			case 'BiliCategoryListDataItem':
			return BiliCategoryListDataItem().fromJson(json);			case 'BiliCategoryListDataItemsUser':
			return BiliCategoryListDataItemsUser().fromJson(json);			case 'BiliCategoryListDataItemsItem':
			return BiliCategoryListDataItemsItem().fromJson(json);			case 'BiliCategoryListDataItemsItemPicture':
			return BiliCategoryListDataItemsItemPicture().fromJson(json);			case 'GankCategoryListBean':
			return GankCategoryListBean().fromJson(json);			case 'GankCategoryBean':
			return GankCategoryBean().fromJson(json);    }
    return null;
  }

  //empty list is returned by type
  static _getListFromType(String type) {
    switch (type) {			case 'BiliCategoryListEntity':
			return List<BiliCategoryListEntity>();			case 'BiliCategoryListData':
			return List<BiliCategoryListData>();			case 'BiliCategoryListDataItem':
			return List<BiliCategoryListDataItem>();			case 'BiliCategoryListDataItemsUser':
			return List<BiliCategoryListDataItemsUser>();			case 'BiliCategoryListDataItemsItem':
			return List<BiliCategoryListDataItemsItem>();			case 'BiliCategoryListDataItemsItemPicture':
			return List<BiliCategoryListDataItemsItemPicture>();			case 'GankCategoryListBean':
			return List<GankCategoryListBean>();			case 'GankCategoryBean':
			return List<GankCategoryBean>();    }
    return null;
  }

  static M fromJsonAsT<M>(json) {
    String type = M.toString();
    if (json is List && type.contains("List<")) {
      String itemType = type.substring(5, type.length - 1);
      List tempList = _getListFromType(itemType);
      json.forEach((itemJson) {
        tempList
            .add(_fromJsonSingle(type.substring(5, type.length - 1), itemJson));
      });
      return tempList as M;
    } else {
      return _fromJsonSingle(M.toString(), json) as M;
    }
  }
}