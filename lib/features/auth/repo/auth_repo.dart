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
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dioHelper.postRequest(
        endPoint: ApiEndpoints.loginEndpoint,
        data: {"email": email, "password": password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data["token"] != null) {
          await locator<StorageHelper>().saveToken(response.data["token"]);
          return right(LoginResponseModel.fromJson(response.data));
        } else {
          return left(response.data["message"] ?? "Login failed");
        }
      } else {
        return left(response.data["message"] ?? "Login failed");
      }
    } on DioException catch (e) {
      // Extract error message from API response
      if (e.response?.data != null) {
        final errorMessage =
            e.response!.data["message"] ??
            e.response!.data["error"] ??
            e.response!.data["errors"]?.toString() ??
            "Login failed";
        return left(errorMessage.toString());
      }
      return left("Network error: ${e.message}");
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, LoginResponseModel>> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      final response = await _dioHelper.postRequest(
        endPoint: ApiEndpoints.registerEndpoint,
        data: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": password,
          "phone": phone,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data["token"] != null) {
          await locator<StorageHelper>().saveToken(response.data["token"]);
          return right(LoginResponseModel.fromJson(response.data));
        } else {
          return left(response.data["message"] ?? "Registration failed");
        }
      } else {
        return left(response.data["message"] ?? "Registration failed");
      }
    } on DioException catch (e) {
      // Extract error message from API response
      if (e.response?.data != null) {
        final errorMessage =
            e.response!.data["message"] ??
            e.response!.data["error"] ??
            e.response!.data["errors"]?.toString() ??
            "Registration failed";
        return left(errorMessage.toString());
      }
      return left("Network error: ${e.message}");
    } catch (e) {
      return left(e.toString());
    }
  }
}
