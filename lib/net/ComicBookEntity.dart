// To parse this JSON data, do
//
//     final comicBookEntity = comicBookEntityFromJson(jsonString);

import 'dart:convert';

class ComicBookEntity {
  int id;
  int islong;
  int direction;
  String title;
  int isDmzj;
  String cover;
  String description;
  int lastUpdatetime;
  String lastUpdateChapterName;
  int copyright;
  String firstLetter;
  String comicPy;
  int hidden;
  int hotNum;
  int hitNum;
  dynamic uid;
  int isLock;
  int lastUpdateChapterId;
  List<Author> types;
  List<Author> status;
  List<Author> authors;
  int subscribeNum;
  List<Chapter> chapters;
  Comment comment;
  List<dynamic> urlLinks;
  String isHideChapter;
  List<DhUrlLink> dhUrlLinks;
  String isDot;

  ComicBookEntity({
    this.id,
    this.islong,
    this.direction,
    this.title,
    this.isDmzj,
    this.cover,
    this.description,
    this.lastUpdatetime,
    this.lastUpdateChapterName,
    this.copyright,
    this.firstLetter,
    this.comicPy,
    this.hidden,
    this.hotNum,
    this.hitNum,
    this.uid,
    this.isLock,
    this.lastUpdateChapterId,
    this.types,
    this.status,
    this.authors,
    this.subscribeNum,
    this.chapters,
    this.comment,
    this.urlLinks,
    this.isHideChapter,
    this.dhUrlLinks,
    this.isDot,
  });

  factory ComicBookEntity.fromJson(String str) => ComicBookEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ComicBookEntity.fromMap(Map<String, dynamic> json) => ComicBookEntity(
    id: json["id"],
    islong: json["islong"],
    direction: json["direction"],
    title: json["title"],
    isDmzj: json["is_dmzj"],
    cover: json["cover"],
    description: json["description"],
    lastUpdatetime: json["last_updatetime"],
    lastUpdateChapterName: json["last_update_chapter_name"],
    copyright: json["copyright"],
    firstLetter: json["first_letter"],
    comicPy: json["comic_py"],
    hidden: json["hidden"],
    hotNum: json["hot_num"],
    hitNum: json["hit_num"],
    uid: json["uid"],
    isLock: json["is_lock"],
    lastUpdateChapterId: json["last_update_chapter_id"],
    types: List<Author>.from(json["types"].map((x) => Author.fromMap(x))),
    status: List<Author>.from(json["status"].map((x) => Author.fromMap(x))),
    authors: List<Author>.from(json["authors"].map((x) => Author.fromMap(x))),
    subscribeNum: json["subscribe_num"],
    chapters: List<Chapter>.from(json["chapters"].map((x) => Chapter.fromMap(x))),
    comment: Comment.fromMap(json["comment"]),
    urlLinks: List<dynamic>.from(json["url_links"].map((x) => x)),
    isHideChapter: json["isHideChapter"],
    dhUrlLinks: List<DhUrlLink>.from(json["dh_url_links"].map((x) => DhUrlLink.fromMap(x))),
    isDot: json["is_dot"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "islong": islong,
    "direction": direction,
    "title": title,
    "is_dmzj": isDmzj,
    "cover": cover,
    "description": description,
    "last_updatetime": lastUpdatetime,
    "last_update_chapter_name": lastUpdateChapterName,
    "copyright": copyright,
    "first_letter": firstLetter,
    "comic_py": comicPy,
    "hidden": hidden,
    "hot_num": hotNum,
    "hit_num": hitNum,
    "uid": uid,
    "is_lock": isLock,
    "last_update_chapter_id": lastUpdateChapterId,
    "types": List<dynamic>.from(types.map((x) => x.toMap())),
    "status": List<dynamic>.from(status.map((x) => x.toMap())),
    "authors": List<dynamic>.from(authors.map((x) => x.toMap())),
    "subscribe_num": subscribeNum,
    "chapters": List<dynamic>.from(chapters.map((x) => x.toMap())),
    "comment": comment.toMap(),
    "url_links": List<dynamic>.from(urlLinks.map((x) => x)),
    "isHideChapter": isHideChapter,
    "dh_url_links": List<dynamic>.from(dhUrlLinks.map((x) => x.toMap())),
    "is_dot": isDot,
  };
}

class Author {
  int tagId;
  String tagName;

  Author({
    this.tagId,
    this.tagName,
  });

  factory Author.fromJson(String str) => Author.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Author.fromMap(Map<String, dynamic> json) => Author(
    tagId: json["tag_id"],
    tagName: json["tag_name"],
  );

  Map<String, dynamic> toMap() => {
    "tag_id": tagId,
    "tag_name": tagName,
  };
}

class Chapter {
  String title;
  List<Datum> data;

  Chapter({
    this.title,
    this.data,
  });

  factory Chapter.fromJson(String str) => Chapter.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Chapter.fromMap(Map<String, dynamic> json) => Chapter(
    title: json["title"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "title": title,
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
  };
}

class Datum {
  int chapterId;
  String chapterTitle;
  int updatetime;
  int filesize;
  int chapterOrder;

  Datum({
    this.chapterId,
    this.chapterTitle,
    this.updatetime,
    this.filesize,
    this.chapterOrder,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    chapterId: json["chapter_id"],
    chapterTitle: json["chapter_title"],
    updatetime: json["updatetime"],
    filesize: json["filesize"],
    chapterOrder: json["chapter_order"],
  );

  Map<String, dynamic> toMap() => {
    "chapter_id": chapterId,
    "chapter_title": chapterTitle,
    "updatetime": updatetime,
    "filesize": filesize,
    "chapter_order": chapterOrder,
  };
}

class Comment {
  int commentCount;
  List<LatestComment> latestComment;

  Comment({
    this.commentCount,
    this.latestComment,
  });

  factory Comment.fromJson(String str) => Comment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Comment.fromMap(Map<String, dynamic> json) => Comment(
    commentCount: json["comment_count"],
    latestComment: List<LatestComment>.from(json["latest_comment"].map((x) => LatestComment.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "comment_count": commentCount,
    "latest_comment": List<dynamic>.from(latestComment.map((x) => x.toMap())),
  };
}

class LatestComment {
  int commentId;
  int uid;
  String content;
  int createtime;
  String nickname;
  String avatar;

  LatestComment({
    this.commentId,
    this.uid,
    this.content,
    this.createtime,
    this.nickname,
    this.avatar,
  });

  factory LatestComment.fromJson(String str) => LatestComment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LatestComment.fromMap(Map<String, dynamic> json) => LatestComment(
    commentId: json["comment_id"],
    uid: json["uid"],
    content: json["content"],
    createtime: json["createtime"],
    nickname: json["nickname"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toMap() => {
    "comment_id": commentId,
    "uid": uid,
    "content": content,
    "createtime": createtime,
    "nickname": nickname,
    "avatar": avatar,
  };
}

class DhUrlLink {
  String title;
  List<dynamic> list;

  DhUrlLink({
    this.title,
    this.list,
  });

  factory DhUrlLink.fromJson(String str) => DhUrlLink.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DhUrlLink.fromMap(Map<String, dynamic> json) => DhUrlLink(
    title: json["title"],
    list: List<dynamic>.from(json["list"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "title": title,
    "list": List<dynamic>.from(list.map((x) => x)),
  };
}
