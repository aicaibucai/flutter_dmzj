import 'dart:math';

import 'package:dmzjflutter/model/BaseModel.dart';
import 'package:dmzjflutter/model/BookDetailsModel.dart';
import 'package:dmzjflutter/net/ComicBookEntity.dart';
import 'package:dmzjflutter/net/NetManage.dart';
import 'package:dmzjflutter/viewmodel/BaseViewModel.dart' as BaseViewModel;

class ComicPageViewModel extends BaseViewModel.BaseViewModel {
  num _bookId;
  String _title;
  BookDetailsModel result;
  bool _reverse = false;

  bool get reverse => _reverse;

  num get bookId => _bookId;

  ComicPageViewModel(this._bookId);

  @override
  void init() {
    // TODO: implement init
    getComicBook();
  }

  void changeSort(bool reverse) {
    _reverse = reverse;
    notifyListeners();
  }

  void getComicBook() async {
    updateStatus(BaseViewModel.Status.INIT_LOADING);
    var temp =
        await NetManage.instance.getComicBookDetails(_bookId).then((value) {
      ComicBookEntity comicBookEntity = ComicBookEntity.fromJson(value);
      return BookDetailsModel.comicBook(comicBookEntity);
    }).catchError((e) {
      return ErrorStatus(e);
    });
    if (temp is ErrorStatus) {
      updateStatus(BaseViewModel.Status.ERROR);
    } else {
      result = temp;
      _title = result.title;
      updateStatus(BaseViewModel.Status.SUCCESS);
    }
  }

  String get title => _title;
}
