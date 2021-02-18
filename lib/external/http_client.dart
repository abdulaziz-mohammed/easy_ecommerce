import 'dart:async';

import 'package:dio/dio.dart';
import '../errors/errors.dart';

class HttpClient {
  Dio dio;

  final _onResponse = StreamController<Response>();

  HttpClient({String baseUrl}) {
    dio = new Dio();
    dio.options.baseUrl = baseUrl;

    dio.options.connectTimeout = 1000 * 10;
    dio.options.receiveTimeout = 1000 * 10;
    dio.options.sendTimeout = 1000 * 10;

    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      // Do something before request is sent
      return options; //continue
      // If you want to resolve the request with some custom data，
      // you can return a `Response` object or return `dio.resolve(data)`.
      // If you want to reject the request with a error message,
      // you can return a `DioError` object or return `dio.reject(errMsg)`
    }, onResponse: (Response response) {
      // Do something with response data
      _onResponse.sink.add(response);
      return response; // continue
    }, onError: (DioError e) {
      _onResponse.sink.add(e.response);
      if (e.response != null && e.response.statusCode == 401) {
        throw new AuthTokenError();
      } else if (e.response != null &&
          e.response.statusCode == 400 &&
          e.response?.data["errorMessage"] != null) {
        throw new AppError(message: e.response?.data["errorMessage"]);
      } else {
        throw new NetworkError();
      }
    }));
  }

  Future<Response> post<T>(String url, dynamic data,
      {dynamic query, Map<String, String> headers}) async {
    try {
      var response = await (dio.post(url,
          data: data,
          queryParameters: query,
          options: Options(headers: headers)));

      return response;
    } on DioError catch (e) {
      throw e.error;
    } catch (e) {
      throw new AppError();
    }
  }

  Future<Response> get(String url,
      {dynamic query, Map<String, String> headers}) async {
    try {
      var response = await dio.get(url,
          queryParameters: query, options: Options(headers: headers));

      return response;
    } on DioError catch (e) {
      throw e.error;
    } catch (e) {
      throw new AppError();
    }
  }

  Future<Response> put<T>(String url, dynamic data,
      {dynamic query, Map<String, String> headers}) async {
    try {
      var response = await (dio.put(url,
          data: data,
          queryParameters: query,
          options: Options(headers: headers)));

      return response;
    } on DioError catch (e) {
      throw e.error;
    } catch (e) {
      throw new AppError();
    }
  }

  Stream<Response> onResponse() {
    return _onResponse.stream;
  }
}
