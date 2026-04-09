import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app2/core/di/service_locator.dart';
import 'package:ecommerce_app2/core/networking/app_endpoints.dart';
import 'package:ecommerce_app2/core/networking/dio_helper.dart';
import 'package:ecommerce_app2/core/networking/storage_helper.dart';
import 'package:ecommerce_app2/features/auth/models/login_response_model.dart';

class AuthRepo {
  final DioHelper _dioHelper;

  AuthRepo(this._dioHelper);
  Future<Either<String, LoginResponseModel>> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _dioHelper.postRequest(
        endPoint: ApiEndpoints.getLoginEndpoint,
        data: {"username": username, "password": password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data["accessToken"] != null) {
          await locator<StorageHelper>().saveToken(
            response.data["accessToken"],
          );
          return right(LoginResponseModel.fromJson(response.data));
        } else {
          return left(response.data["message"]);
        }
      } else {
        return left(response.data["message"]);
      }
    } catch (e) {
      if (e is DioException && e.response!.statusCode == 400) {
        return left(e.response!.data["message"]);
      }
      return left(e.toString());
    }
  }
}
