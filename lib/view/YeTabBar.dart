import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class YeTabBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _YeTabBarState();
  }
}

class _YeTabBarState extends State<YeTabBar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      fit: StackFit.loose,
      children: <Widget>[
        Text("1"),
        Text("2"),
        Text("3"),
        Text("4"),
        Text("5"),
        Text("6")
      ],
    );
  }
}
