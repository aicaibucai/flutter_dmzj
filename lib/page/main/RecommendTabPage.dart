import 'package:dmzjflutter/model/RecommendModel.dart';
import 'package:dmzjflutter/net/RecommendEntity.dart';
import 'package:dmzjflutter/view/RecommendItem.dart';
import 'package:dmzjflutter/viewmodel/BaseViewModel.dart' as BaseViewModel;
import 'package:dmzjflutter/viewmodel/RecommendViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class RecommendTabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RecommendTagState();
  }
}

class RecommendTagState extends State<RecommendTabPage> {
  RecommendViewModel _viewModel;
  ScrollController _controller;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Selector<RecommendViewModel, BaseViewModel.Status>(
          builder: (_, status, widget) {
            Widget widget;
            switch (status) {
              case BaseViewModel.Status.INIT_LOADING:
              case BaseViewModel.Status.INIT:
                {
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
                }
                break;
              case BaseViewModel.Status.EMPTY:
                {
                  widget = Center(
                    child: Container(
                      child: Column(
                        children: <Widget>[Text("没有内容")],
                      ),
                    ),
                  );
                }
                break;
              case BaseViewModel.Status.LOADING:
              case BaseViewModel.Status.LOAD_MORE:
              case BaseViewModel.Status.SUCCESS:
                {
                  widget = RefreshIndicator(
                      child:
                      Selector<RecommendViewModel, List<RecommendEntity>>(
                        builder: (_, model, widget) {
                          return ListView.builder(
                            controller: _controller,
                            itemBuilder: (_, index) {
                              RecommendEntity item = model[index];
                              return RecommendItem.modelInsert(rankRecommendModel(item));
                            },
                            itemCount: model != null ? model.length : 0,
                            physics: AlwaysScrollableScrollPhysics(),
                          );
                        },
                        selector: (_, rmodel) => rmodel.result,
                      ),
                      onRefresh: () async {
                        _viewModel.updateStatus(BaseViewModel.Status.LOADING);
                        await _viewModel.getRecommendInfo();
                      });
                }
                break;
              default:
                {}

                break;
            }
            return widget;
          },
          selector: (_, model) => _viewModel.status),
    );
  }

  RecommendModel rankRecommendModel(RecommendEntity entity) {
    RecommendModel recommendModel = null;
    if (entity != null) {
      List<ComicModel> comics = entity.data.map((e) {
        return ComicModel(e.title, e.objId, true,e.cover);
      }).toList();
      recommendModel =
          RecommendModel(entity.title, entity.categoryId, entity.sort,true,comics);
    }
    return recommendModel;
  }

  @override
  void initState() {
    super.initState();
    _viewModel = RecommendViewModel();
    _controller = ScrollController();
    Future.delayed(Duration(milliseconds: 500))
        .then((value) => _viewModel.init());
  }
}
