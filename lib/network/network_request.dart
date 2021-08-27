import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'dart:io';

enum Method { GET, POST, DELETE, PUT, PATCH, HEAD }

const MethodValues = {
  Method.GET: "get",
  Method.POST: "post",
  Method.DELETE: "delete",
  Method.PUT: "put",
  Method.PATCH: "patch",
  Method.HEAD: "head",
};

const int _connectTimeout = 15000; //15s
const int _receiveTimeout = 15000;
const int _sendTimeout = 10000;

typedef Success<T> = Function(T data);
typedef Failed = Function(int code, String msg);

class NetworkRequest {

  static final Dio dio = Dio(BaseOptions(
    /// 请求的Content-Type，默认值是"application/json; charset=utf-8".
    /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
    /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]就会自动编码请求体.
    /// contentType: Headers.formUrlEncodedContentType, // 适用于post form表单提交
      responseType: ResponseType.json,
      connectTimeout: _connectTimeout,
      receiveTimeout: _receiveTimeout,
      sendTimeout: _sendTimeout
  ));
  static Future requestData(String url, {Method method = Method.GET, Map<String, dynamic>? params, Map<String, dynamic>? headers, Success? success, Failed? failed}) async {
    try {
      ///没有网络
      var connectivityResult = await Connectivity().checkConnectivity();
      if(connectivityResult == ConnectivityResult.none){
        if(failed != null){
          failed(1002, "网络异常，请检查你的网络！");
        }
        return;
      }

      ///创建请求配置
      final option = Options(method: MethodValues[method], headers: headers);
      Response response = await dio.request(url, queryParameters: params, options: option);
      if(response.data != null){
        if(success != null){
          success(response.data);
        }
      } else {
        if(failed != null){
          failed(9999, "未知错误，请求数据失败");
        }
      }

    } on DioError catch(e) {
      if(failed != null){
        if(e is SocketException) {
          failed(1002, "网络异常，请检查你的网络");
        } else if (e is HttpException) {
          failed(1003, "服务器异常");
        } else if (e is FormatException) {
          failed(1001, "数据解析错误");
        } else if(e.type == DioErrorType.connectTimeout || e.type == DioErrorType.sendTimeout ||
            e.type == DioErrorType.receiveTimeout){
          failed(1004, "连接超时");
        } else if (e.type == DioErrorType.cancel){
          failed(1005, "取消请求");
        } else {
          failed(9999, "未知异常");
        }

      }
    }

  }

}