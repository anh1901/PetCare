import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/foundation.dart';
import 'package:petcare/caches/shared_storage.dart';
import 'package:petcare/models/config_info_model.dart';
import 'package:petcare/models/divice_info_model.dart';
import 'package:petcare/models/login_info_model.dart';

import 'http_config.dart';

_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

abstract class BaseHttp extends DioForNative {
  BaseHttp() {
    (transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
    interceptors..add(HeaderInterceptor());
    init();
  }

  void init();
}

class HeaderInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.connectTimeout = HttpConfig.timeout;
    options.receiveTimeout = HttpConfig.timeout;
    options.baseUrl = HttpConfig.baseURL;
    options.headers = getHeader();
    return handler.next(options);
  }

  static Map<String, dynamic> getHeader() {
    LoginInfo loginInfo = SharedStorage.loginInfo;
    ConfigInfo configInfo = SharedStorage.configInfo;
    DeviceInfoModel deviceInfo = SharedStorage.deviceInfo;

    Map<String, dynamic> headers = {
      'Accept': '*/*',
      'H5Auth': '0',
      'channel': 'AppStore',
      'terminal': 'iOS',
      'platformType': '0',
      'clientVersion': '3.1.8',
      'Authorization': loginInfo.token,
      'loginType': configInfo.loginType,
      'deviceBrand': 'Apple',
      'deviceModel': configInfo.deviceModel,
      'sysVersion': configInfo.sysVersion,
      'deviceNo': configInfo.deviceNo,
    };
    return headers;
  }
}

abstract class BaseResponseData {
  int code = 0;
  String message;
  dynamic data;
  bool isSuccess;

  BaseResponseData({this.code, this.message, this.data, this.isSuccess});

  @override
  String toString() {
    return 'BaseRespData{code: $code, message: $message, data: $data}';
  }
}

class NotSuccessException implements Exception {
  String message;

  NotSuccessException.fromRespData(BaseResponseData respData) {
    message = respData.message;
  }

  @override
  String toString() {
    return 'NotExpectedException{respData: $message}';
  }
}

class UnAuthorizedException implements Exception {
  const UnAuthorizedException();

  @override
  String toString() => 'UnAuthorizedException';
}
