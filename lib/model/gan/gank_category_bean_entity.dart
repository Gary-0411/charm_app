import 'package:charm_app/generated/json/base/json_convert_content.dart';
import 'package:charm_app/generated/json/base/json_field.dart';

class GankCategoryListBean with JsonConvert<GankCategoryListBean> {
	List<GankCategoryBean> data;
	int page;
	@JSONField(name: "page_count")
	int pageCount;
	int status;
	@JSONField(name: "total_counts")
	int totalCounts;
}

class GankCategoryBean with JsonConvert<GankCategoryBean> {
	@JSONField(name: "_id")
	String sId;
	String author;
	String category;
	String createdAt;
	String desc;
	List<String> images;
	int likeCounts;
	String publishedAt;
	int stars;
	String title;
	String type;
	String url;
	int views;
}
