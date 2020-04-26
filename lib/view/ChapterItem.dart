import 'package:dmzjflutter/model/BookDetailsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChapterItem extends StatefulWidget {
  BookChapterModel chapterModel;
  bool reverse;

  ChapterItem(this.chapterModel, this.reverse);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChapterState();
  }
}

class ChapterState extends State<ChapterItem> {
  BookChapterModel _chapterModel;
  bool _clickmore;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
        children: <Widget>[
          Text(_chapterModel.chapter_title),
          GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2),
              itemCount: _clickmore ? 12 : _chapterModel.date.length,
              itemBuilder: (_, index) {
                return Container(
                  child: Center(
                    child: _clickmore && index == 11
                        ? Text("....")
                        : Text(widget.reverse
                            ? _chapterModel.date.reversed
                                .toList()[index]
                                .chapter_title
                            : _chapterModel.date[index].chapter_title),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                );
              }),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _chapterModel = widget.chapterModel;
    _clickmore = _chapterModel.date.length > 12;
  }
}
