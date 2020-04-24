import 'package:flutter/widgets.dart';

abstract class BaseViewModel with ChangeNotifier{
 Status _status=Status.INIT;

 Status get status => _status;

 set status(Status value) {
  _status = value;
 }

 void updateStatus(Status status){
  this.status=status;
  notifyListeners();
 }
 void init();
}
enum Status{INIT,INIT_LOADING,LOADING,SUCCESS,EMPTY,ERROR,LOAD_MORE}