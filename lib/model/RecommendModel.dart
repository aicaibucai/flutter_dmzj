import 'package:flutter/widgets.dart';

class RecommendModel{
  String title;
  int id;
  int index;
  bool isClick;
  List<ComicModel> comics;
  RecommendModel(this.title, this.id, this.index, this.isClick, this.comics);


}

class ComicModel{
  String name;
  num comic_id;
  bool update;
  String image;
  ComicModel(this.name, this.comic_id, this.update,this.image);

}