import 'package:dio/dio.dart';
import 'package:package_info/package_info.dart';
import 'dart:convert';
class NetManage{
  factory NetManage() =>_getInstance();
  static NetManage get instance => _getInstance();
  static NetManage _instance;

  static NetManage _getInstance() {
    if (_instance == null) {
      _instance = new NetManage._internal();
    }
    return _instance;
  }
  Dio _dio;
  BaseOptions _options;
  final int _TIME_OUT=10*1000;
  final String _BASE_URL="http://v3api.dmzj.com/";
  NetManage._internal(){
    Map<String,String> baseParam={
      "channel":"Android",
      "_debug":"0",
      "version":"2.7.026",
    };
    _options=BaseOptions(sendTimeout: _TIME_OUT,receiveTimeout: _TIME_OUT,baseUrl: _BASE_URL,queryParameters: baseParam,responseType: ResponseType.plain);
    _dio=Dio(_options);
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (request)async{
      print("请求报文:${request.uri.toString()}");
      return request;
    },onResponse: (response){
      print("响应报文:${json.decode(response.toString())}");
      return response;
    }));
  }

  Future<String> getRecommendPage()async{
    Map<String,num> param={
      "timestamp":DateTime.now().millisecondsSinceEpoch,
    };
   return await _dio.get("recommend_index_android.json",queryParameters: param).then((value){
     return value.toString();
   });

  }



}