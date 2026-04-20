import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerce_app2/core/di/service_locator.dart';
import 'package:ecommerce_app2/core/networking/app_endpoints.dart';
import 'package:ecommerce_app2/core/networking/storage_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  Dio? dio;

  DioHelper() {
    initDio();
  }

  initDio() {
    dio ??= Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    // Add interceptor to attach token automatically
    dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await locator<StorageHelper>().getToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (error, handler) async {
          return handler.next(error);
        },
      ),
    );

    dio!.interceptors.add(PrettyDioLogger());
  }

  Future<Response> getRequest({
    required String endPoint,
    Map<String, dynamic> query = const {},
  }) async {
    try {
      Response response = await dio!.get(endPoint, queryParameters: query);
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<Response> postRequest({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      Response response = await dio!.post(endPoint, data: data);
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Never _handleDioError(DioException e) {
    // Log the error for debugging
    log('DioError: ${e.message}');
    log('Response: ${e.response?.data}');
    // Re-throw to be handled by the caller
    throw e;
  }
}
