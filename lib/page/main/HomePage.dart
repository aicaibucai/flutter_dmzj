import 'package:dmzjflutter/page/main/RecommendTabPage.dart';
import 'package:dmzjflutter/view/YzTabDecoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<String> tabs;
  TabController _controller;
  double tabHeight = 40.0;

  @override
  void initState() {
    super.initState();
    tabs = <String>["推荐", "更新", "分类", "排行", "专题"];
    _controller = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("HomePageBuild");
    return WillPopScope(
        child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: Row(
                  children: <Widget>[
                    Expanded(child: TabBar(
                        labelColor: Colors.blue,
                        unselectedLabelColor: Colors.black,
                        controller: _controller,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: YzTabDecoration(),
                        tabs:
                        tabs.map((e) {
                          return Container(child: Center(child: Text(e),),
                            height: tabHeight,);
                        }).toList(),
                    ),),
                    CupertinoButton(child: Icon(Icons.search,color: Colors.black45,),onPressed: (){}),
                  ],
                ),
              ),
              body: Container(child: RecommendTabPage(),),
            )),
        onWillPop: () async {
          return true;
        });
  }
}
