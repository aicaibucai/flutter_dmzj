import 'package:cached_network_image/cached_network_image.dart';
import 'package:dmzjflutter/model/RecommendModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RecommendItem extends StatelessWidget {
  bool isClick;
  String title;
  Icon icon;
  RecommendModel model;
  RecommendItem.modelInsert(RecommendModel recommendModel) {
    if (recommendModel == null) {
      this.isClick = true;
      this.title = "Title";
      this.icon = const Icon(
        Icons.error,
        color: Colors.red,
      );
      model=null;
    } else {
      isClick = recommendModel.isClick;
      title = recommendModel.title;
      model=recommendModel;
      icon = const Icon(
        Icons.error,
        color: Colors.red,
      );
    }
  }

  RecommendItem(
      {this.isClick = true,
      this.title = "Title",
      this.icon = const Icon(
        Icons.error,
        color: Colors.red,
      ),this.model});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double screenWidth;
    double screenHeight;
    var size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            height: 40,
            padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Row(
              children: <Widget>[
                icon,
                Expanded(
                  child: Container(
                    child: Text(
                      title,
                    ),
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  ),
                  flex: 1,
                ),
                Offstage(
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.blue,
                  ),
                  offstage: !isClick,
                )
              ],
            ),
          ),
          Container(
            child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: model.comics==null?0:model.comics.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                    crossAxisCount: 3),
                itemBuilder: (_, index) {
                  return ComicItem.sizeCreate(
                      caleItemSize(screenWidth, screenHeight),model.comics[index]);
                }),
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          )
        ],
      ),
    );
  }
  Size caleItemSize(double width, double height) {
    var tw = (width / 3) - 30;
    var th = (height / 4) - 20;
    return Size(tw, th);
  }

}

class ComicItem extends StatelessWidget {
  double width;
  double height;
  ComicModel comicModel;
  ComicItem(this.width, this.height,this.comicModel);

  ComicItem.sizeCreate(Size size,ComicModel model) {
    width = size.width;
    height = size.height;
    comicModel=model;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          width: width,
          height: height,
          child: Image(image: CachedNetworkImageProvider(comicModel.image)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
        ),
        Center(
          child: Text(comicModel.name),
        ),
      ],
    );
  }
}
