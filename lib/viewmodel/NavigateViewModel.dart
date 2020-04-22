import 'package:dmzjflutter/page/main/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigateViewModel with ChangeNotifier {
  int _currentIndex = 0;
  Widget _currentWidget;
  List<BottomNavigationBarItem> _items;
  List<Widget> _pages;

  int get currentIndex => _currentIndex;

  Widget get currentWidget => _currentWidget;

  List<BottomNavigationBarItem> get items => _items;

  List<Widget> get pages => _pages;

  void changePage(int index,{bool update=false}){
    _currentIndex=index;
    _currentWidget=_pages[_currentIndex];
    if(update){
      notifyListeners();
    }
  }

  void initModel({int index = 0}) {
    _currentIndex = index;
    _items = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          title: Text("漫画",),
          activeIcon: Icon(
            Icons.assignment,
            color: Colors.blue,
          )),
      BottomNavigationBarItem(
          icon: Icon(Icons.chrome_reader_mode),
          title: Text("新闻",style: TextStyle(color: Colors.black),),
          activeIcon: Icon(
            Icons.chrome_reader_mode,
            color: Colors.blue,
          )),
      BottomNavigationBarItem(
          icon: Icon(Icons.book),
          title: Text("轻小说",style: TextStyle(color: Colors.black),),
          activeIcon: Icon(
            Icons.book,
            color: Colors.blue,
          )),
      BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          title: Text("我的",style: TextStyle(color: Colors.black),),
          activeIcon: Icon(
            Icons.account_circle,
            color: Colors.blue,
          )),
    ];
    _pages = <Widget>[
      HomePage(),
      Container(
        child: Center(
          child: Text("新闻"),
        ),
      ),
      Container(
        child: Center(
          child: Text("轻小说"),
        ),
      ),
      Container(
        child: Center(
          child: Text("我的"),
        ),
      ),
    ];
  }
}
