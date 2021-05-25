import 'package:dio/dio.dart';
import 'package:petcare/widgets/toast.dart';

import 'http_base.dart';

final RequestUrl http = RequestUrl();

class RequestUrl extends BaseHttp {
  @override
  void init() {
    interceptors.add(ApiInterceptor());
  }

  static Future<T> getRequest<T>(String url) async {
    return requestData(url);
  }

  static Future<T> postRequest<T>(
      String url, Map<String, dynamic> params) async {
    return requestData(url, method: 'post', params: params);
  }

  static Future<T> requestData<T>(String url,
      {String method = "get",
      Map<String, dynamic> params,
      Interceptor inter}) async {
    final options = Options(method: method);
    try {
      Response response =
          await http.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch (e) {
      Toast.showError('Failed, try again');
      return Future.error(e);
    }
  }
}

class ApiInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('response = ${response.data}');
    ResponseData respData = ResponseData.fromJson(response.data);
    if (respData.isSuccess) {
      response.data = respData;
      return handler.resolve(response);
    } else {
      Toast.showError(respData.message);
      throw NotSuccessException.fromRespData(respData);
    }
  }
}

class ResponseData extends BaseResponseData {
  bool get success => 0 == code;

  ResponseData.fromJson(Map<String, dynamic> json) {
    code = json['status'];
    message = json['message'];
    data = json['data'];
    isSuccess = json['rel'];
  }
}
