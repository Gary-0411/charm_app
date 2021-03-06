import 'package:charm_app/generated/json/base/json_convert_content.dart';
import 'package:charm_app/model/gan/http_error.dart';
import 'package:dio/dio.dart';

class DioBili {
  static Dio _dio;

  static Dio get dio => _getDioInstance();

  static Dio _getDioInstance() {
    if (_dio == null) {
      _dio = _instance();
    }
    return _dio;
  }

  static Dio _instance() {
    BaseOptions options = new BaseOptions(
      baseUrl: 'http://api.vc.bilibili.com/link_draw/v2/',
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: {},
    );
    _dio = Dio(options);
    _dio.interceptors
      ..add(LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ))
      ..add(InterceptorsWrapper(
        onRequest: (RequestOptions options) async {
          return options;
        },
        onResponse: (Response response) {
          return response;
        },
        onError: (DioError e) {
          return HttpError.dioError(e);
        },
      ));
    return _dio;
  }

  static Future<Map> post(String url,
      {parameters,
      Function(dynamic t) onSuccess,
      Function(String error) onError}) async {
    var result;
    try {
      var response = await dio.post(url, data: parameters);
      result = response.data;
      if (response.statusCode == 200) {
        if (onSuccess != null) {
          response.data["status"] = response.data["status"].toString();
          if (response.data["status"] == 100) {
            onSuccess(response.data["data"]);
          } else {
            throw HttpError(response.data, response.data);
          }
        }
      } else {
        throw Exception('statusCode:${response.statusCode}');
      }
    } catch (e) {
      print(e);

      if (onError == null) {
        // showToast(e.toString(), duration: Duration(seconds: 4));
      } else {
        onError(e.toString());
      }
    }
    return result;
  }

  static Future<Map> get<T>(String url,
      {parameters,
      Function(T t) onSuccess,
      Function(String error) onError}) async {
    var result;
    try {
      var response = await dio.get(url, queryParameters: parameters);
      result = response.data;
      if (response.statusCode == 200) {
        if (onSuccess != null) {
          if (result["code"] == 0) {
            onSuccess(JsonConvert.fromJsonAsT<T>(result));
          } else {
            throw HttpError(response.data, response.data);
          }
        }
      } else {
        throw Exception('statusCode:${response.statusCode}');
      }
    } catch (e) {
      print(e);

      if (onError == null) {
        // showToast(e.toString(), duration: Duration(seconds: 4));
      } else {
        onError(e.toString());
      }
    }
    return result;
  }
}
