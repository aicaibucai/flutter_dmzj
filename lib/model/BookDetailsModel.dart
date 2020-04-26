import 'package:dmzjflutter/net/ComicBookEntity.dart';

class BookDetailsModel {
  String description;
  num book_id;
  String title;
  num last_update_chapter_id;
  num hot_num;
  num last_updatetime;
  String image;
  List<BookTagModel> types = List();
  List<BookTagModel> status = List();
  List<BookTagModel> authors = List();
  List<BookChapterModel> chapters = List();
  List<BookChapterModel> chaptersReverse = List();
  BookDetailsModel.comicBook(ComicBookEntity comicBookEntity) {
    title=comicBookEntity.title;
    description = comicBookEntity.description;
    book_id = comicBookEntity.id;
    last_update_chapter_id = comicBookEntity.lastUpdateChapterId;
    hot_num = comicBookEntity.hotNum;
    last_updatetime = comicBookEntity.lastUpdatetime;
    image = comicBookEntity.cover;
    types = comicBookEntity.types.map((type) {
      return BookTagModel(type.tagId, type.tagName);
    }).toList();
    status = comicBookEntity.status.map((type) {
      return BookTagModel(type.tagId, type.tagName);
    }).toList();
    authors = comicBookEntity.authors.map((type) {
      return BookTagModel(type.tagId, type.tagName);
    }).toList();
    chapters = comicBookEntity.chapters.map((chapter) {
      List<BookChapterData> chapterDatas = chapter.data.map((ch) {
        return BookChapterData(ch.chapterId, ch.chapterTitle, ch.updatetime,
            ch.filesize, ch.chapterOrder);
      }).toList();
      return BookChapterModel(chapter.title, chapterDatas);
    }).toList();
  }
}

class BookTagModel {
  num tag_id;
  String tag_name;

  BookTagModel(this.tag_id, this.tag_name);
}

class BookChapterModel {
  String chapter_title;
  List<BookChapterData> date;

  BookChapterModel(this.chapter_title, this.date);
}

class BookChapterData {
  num chapter_id;
  String chapter_title;
  num updatetime;
  num filesize;
  num chapter_order;

  BookChapterData(this.chapter_id, this.chapter_title, this.updatetime,
      this.filesize, this.chapter_order);
}
