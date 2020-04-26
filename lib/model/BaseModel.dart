import 'package:dio/dio.dart';

class ErrorStatus {
  StatusCode code;
  DioError dioError;

  ErrorStatus(this.dioError) {
    switch (dioError.type) {
      case DioErrorType.SEND_TIMEOUT:
      case DioErrorType.CONNECT_TIMEOUT:
      case DioErrorType.RECEIVE_TIMEOUT:
        code = StatusCode.TIMEOUT;
        break;
      case DioErrorType.RESPONSE:
      case DioErrorType.CANCEL:
      case DioErrorType.DEFAULT:
        code = StatusCode.ERROR;
        break;
    }
  }
}

enum StatusCode { SUCCESS, ERROR, TIMEOUT }
