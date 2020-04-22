import 'package:dmzjflutter/viewmodel/NavigateViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class NavigatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NavigatePageState();
  }
}

class NavigatePageState extends State<NavigatePage> {
  PageController _pageController;
  NavigateViewModel _model;

  @override
  void initState() {
    super.initState();
    _model = NavigateViewModel()..initModel();
    _pageController = PageController(initialPage: _model.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("NavigatePageBuild");
    return ChangeNotifierProvider<NavigateViewModel>.value(
      value: _model,
      child: Scaffold(
        body: PageView.builder(
          itemCount: 4,
          itemBuilder: (_, index) {
            _model.changePage(index);
            return _model.pages[index];
          },
          controller: _pageController,
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          selectedLabelStyle: TextStyle(color: Colors.blue),
          unselectedLabelStyle: TextStyle(color: Colors.black),
          showUnselectedLabels: true,
          items: _model.items,
          currentIndex: _model.currentIndex,
          onTap: (index){
            _model.changePage(index);
            _pageController.jumpToPage(index);
            setState(() {

            });
          },
        ),
      ),
    );
  }
}
