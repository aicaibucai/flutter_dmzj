// To parse this JSON data, do
//
//     final recommendEntity = recommendEntityFromJson(jsonString);

import 'dart:convert';

class RecommendEntity {
  int categoryId;
  String title;
  int sort;
  List<RecommendContent> data;

  RecommendEntity({
    this.categoryId,
    this.title,
    this.sort,
    this.data,
  });

  factory RecommendEntity.fromJson(String str) => RecommendEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RecommendEntity.fromMap(Map<String, dynamic> json) => RecommendEntity(
    categoryId: json["category_id"],
    title: json["title"],
    sort: json["sort"],
    data: List<RecommendContent>.from(json["data"].map((x) => RecommendContent.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "category_id": categoryId,
    "title": title,
    "sort": sort,
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
  };
}

class RecommendContent {
  String cover;
  String title;
  String subTitle;
  int type;
  String url;
  int objId;
  Status status;
  int id;
  String authors;

  RecommendContent({
    this.cover,
    this.title,
    this.subTitle,
    this.type,
    this.url,
    this.objId,
    this.status,
    this.id,
    this.authors,
  });

  factory RecommendContent.fromJson(String str) => RecommendContent.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RecommendContent.fromMap(Map<String, dynamic> json) => RecommendContent(
    cover: json["cover"],
    title: json["title"],
    subTitle: json["sub_title"] == null ? null : json["sub_title"],
    type: json["type"] == null ? null : json["type"],
    url: json["url"] == null ? null : json["url"],
    objId: json["obj_id"] == null ? null : json["obj_id"],
    status: statusValues.map[json["status"]],
    id: json["id"] == null ? null : json["id"],
    authors: json["authors"] == null ? null : json["authors"],
  );

  Map<String, dynamic> toMap() => {
    "cover": cover,
    "title": title,
    "sub_title": subTitle == null ? null : subTitle,
    "type": type == null ? null : type,
    "url": url == null ? null : url,
    "obj_id": objId == null ? null : objId,
    "status": statusValues.reverse[status],
    "id": id == null ? null : id,
    "authors": authors == null ? null : authors,
  };
}

enum Status { EMPTY, STATUS, PURPLE }

final statusValues = EnumValues({
  "连载中": Status.EMPTY,
  "已完结": Status.PURPLE,
  "": Status.STATUS
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
