import 'dart:convert';

import 'package:dmzjflutter/net/NetManage.dart';
import 'package:dmzjflutter/net/RecommendEntity.dart';


import 'BaseViewModel.dart' as BaseViewModel;


class RecommendViewModel extends BaseViewModel.BaseViewModel{
  List<RecommendEntity> _result;

  List<RecommendEntity> get result => _result;


  void getRecommendInfo()async{
    _result=await NetManage.instance.getRecommendPage().then((value){
      List temp=json.decode(value);
      _result=List<RecommendEntity>();
      for(Map<String,dynamic> item in temp){
        _result.add(RecommendEntity.fromMap(item));
      }
      status=BaseViewModel.Status.SUCCESS;
      _result.removeWhere((res){
        return res.categoryId==46||res.categoryId==93;
      });
     return _result;
   }).catchError((error){
     status=BaseViewModel.Status.ERROR;
     return null;
   });
   updateStatus(status);
  }

  void getLoadingSubInfo(){

  }



  @override
  void init() {
    // TODO: implement init
    if(status==BaseViewModel.Status.INIT){
      updateStatus(BaseViewModel.Status.INIT_LOADING);
      getRecommendInfo();
    }
  }
}