import 'package:dartz/dartz.dart';
import 'package:ecommerce_app2/core/di/service_locator.dart';
import 'package:ecommerce_app2/core/networking/storage_helper.dart';
import 'package:ecommerce_app2/features/auth/cubit/auth_state.dart';
import 'package:ecommerce_app2/features/auth/models/login_response_model.dart';
import 'package:ecommerce_app2/features/auth/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInitial());
  final AuthRepo _authRepo;

  void login({required String email, required String password}) async {
    emit(AuthLoading());

    final Either<String, LoginResponseModel> resp = await _authRepo.login(
      email: email,
      password: password,
    );

    resp.fold(
      (error) {
        if (!isClosed) {
          emit(AuthError(error));
        }
      },
      (response) {
        if (!isClosed) {
          emit(AuthSuccess(response.message ?? 'Login successful'));
        }
      },
    );
  }

  void register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(AuthLoading());

    final Either<String, LoginResponseModel> resp = await _authRepo.register(
      name: name,
      email: email,
      password: password,
      phone: phone,
    );

    resp.fold(
      (error) {
        if (!isClosed) {
          emit(AuthError(error));
        }
      },
      (response) {
        if (!isClosed) {
          emit(AuthSuccess(response.message ?? 'Registration successful'));
        }
      },
    );
  }

  Future<bool> checkLoginStatus() async {
    return await locator<StorageHelper>().isLoggedIn();
  }
}
