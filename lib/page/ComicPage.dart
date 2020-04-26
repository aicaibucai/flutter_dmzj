import 'package:cached_network_image/cached_network_image.dart';
import 'package:dmzjflutter/model/BookDetailsModel.dart';
import 'package:dmzjflutter/view/ChapterItem.dart';
import 'package:dmzjflutter/view/ExpansionText.dart';
import 'package:dmzjflutter/viewmodel/BaseViewModel.dart';
import 'package:dmzjflutter/viewmodel/ComicPageViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class ComicChapterPage extends StatefulWidget {
  num comicId;

  ComicChapterPage(this.comicId);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ComicChapterSate();
  }
}

class ComicChapterSate extends State<ComicChapterPage> {
  ComicPageViewModel _pageViewModel;
  num _comidId;

  @override
  void initState() {
    super.initState();
    _comidId = widget.comicId;
    _pageViewModel = ComicPageViewModel(_comidId);
    Future.delayed(Duration(milliseconds: 500)).whenComplete(() {
      _pageViewModel.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider.value(
      value: _pageViewModel,
      child: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                leading: BackButton(
                  color: Colors.black,
                ),
                backgroundColor: Colors.white,
                title: Selector<ComicPageViewModel, String>(
                  selector: (_, model) {
                    return model.title == null ? "" : model.title;
                  },
                  builder: (_, title, widget) {
                    return Text(
                      title,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    );
                  },
                ),
                centerTitle: true,
                actions: <Widget>[
                  MaterialButton(
                    onPressed: () {
                      _pageViewModel.getComicBook();
                    },
                    textColor: Colors.blue,
                    child: Text("下载"),
                  )
                ],
              ),
              body: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Selector<ComicPageViewModel, Status>(
                    builder: (_, status, widget) {
                      Widget widget;
                      switch (status) {
                        case Status.INIT:
                        case Status.INIT_LOADING:
                          widget = Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Loading...."),
                                  CircularProgressIndicator()
                                ],
                              ),
                            ),
                          );
                          break;
                        case Status.LOADING:
                          // TODO: Handle this case.
                          break;
                        case Status.SUCCESS:
                          widget = Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Container(
                                  color: Colors.blue,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        child: Selector<ComicPageViewModel,
                                                String>(
                                            builder: (_, imageurl, widget) {
                                          return Image(
                                              width: 140,
                                              height: 200,
                                              image: CachedNetworkImageProvider(
                                                  imageurl,
                                                  headers: {
                                                    "Referer":
                                                        "http://images.dmzj.com/"
                                                  }));
                                        }, selector: (_, model) {
                                          return model.result.image;
                                        }),
                                      ),
                                      Expanded(
                                          child: Container(
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Text("作者"),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Text("作者"),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Text("作者"),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Text("作者"),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Text("作者"),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Text("作者"),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Text("作者"),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ))
                                    ],
                                  ),
                                ),
                                Container(
                                    child: Selector<ComicPageViewModel, String>(
                                        builder: (_, description, widget) {
                                  return ExpandedText(
                                    description,
                                    textStyle: TextStyle(color: Colors.green),
                                  );
                                }, selector: (_, model) {
                                  return model.result.description;
                                })),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(child: Text("漫画章节")),
                                      Selector<ComicPageViewModel, bool>(
                                          builder: (_, reverse, widget) {
                                            return CupertinoButton(
                                              padding: EdgeInsets.all(0),
                                              child: Text(
                                                "正序↑",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: reverse
                                                        ? Colors.black
                                                        : Colors.blue),
                                              ),
                                              onPressed: () {
                                                if (reverse) {
                                                  _pageViewModel
                                                      .changeSort(false);
                                                }
                                              },
                                            );
                                          },
                                          selector: (_, model) =>
                                              model.reverse),
                                      Selector<ComicPageViewModel, bool>(
                                          builder: (_, reverse, widget) {
                                            return CupertinoButton(
                                                padding: EdgeInsets.all(0),
                                                child: Text(
                                                  "倒序↓",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: !reverse
                                                          ? Colors.black
                                                          : Colors.blue),
                                                ),
                                                onPressed: () {
                                                  if (!reverse) {
                                                    _pageViewModel
                                                        .changeSort(true);
                                                  }
                                                });
                                          },
                                          selector: (_, model) =>
                                              model.reverse),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey,
                                ),
                                Selector<ComicPageViewModel,
                                        Tuple2<List<BookChapterModel>, bool>>(
                                    builder: (_, data, widget) {
                                  return ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (_, index) {
                                      return ChapterItem(
                                          data.item1[index], data.item2);
                                    },
                                    itemCount: data.item1.length,
                                  );
                                }, selector: (_, model) {
                                  return Tuple2(
                                      model.result.chapters, model.reverse);
                                }),
                              ],
                            ),
                          );
                          break;
                        case Status.EMPTY:
                          // TODO: Handle this case.
                          break;
                        case Status.ERROR:
                          // TODO: Handle this case.
                          break;
                        case Status.LOAD_MORE:
                          // TODO: Handle this case.
                          break;
                      }
                      return widget;
                    },
                    selector: (_, model) => model.status),
              ))),
    );
  }
}
