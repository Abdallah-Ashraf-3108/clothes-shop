import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app2/core/networking/app_endpoints.dart';
import 'package:ecommerce_app2/core/networking/dio_helper.dart';
import 'package:ecommerce_app2/features/auth/models/login_response_model.dart';

class AuthRepo {
  Future<Either<String, LoginResponseModel>> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await DioHelper.postRequest(
        endPoint: ApiEndpoints.getLoginEndpoint,
        data: {"username": username, "password": password},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return right(LoginResponseModel.fromJson(response.data));
      } else {
        return left(response.data["message"]);
      }
    } catch (e) {
      if(e is DioException && e.response!.statusCode == 400){
        return left(e.response!.data["message"]);
      }
      return left(e.toString());
    }
  }
}
