import 'package:dmzjflutter/view/YeTabBar.dart';
import 'package:flutter/gestures.dart';
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

  @override
  void initState() {
    super.initState();
    tabs = <String>["推荐", "更新", "分类", "排行", "专题"];
    _controller = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("HomePageBuild");
    return WillPopScope(
        child: SafeArea(
            child: Scaffold(
          appBar: AppBar(

            title: Row(
              children: <Widget>[
                Expanded(child: TabBar(
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.black,
                    controller: _controller,
                    tabs: <Widget>[
                      Text("1"),
                      Text("2"),
                      Text("3"),
                      Text("4"),
                      Text("5"),
                      Text("6")
                    ]),),
                Icon(Icons.access_time)
              ],
            ),
          ),
          body: Column(
            children: <Widget>[],
          ),
        )),
        onWillPop: () async {
          return true;
        });
  }
}
