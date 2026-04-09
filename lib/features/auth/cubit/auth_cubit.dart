import 'package:dartz/dartz.dart';
import 'package:ecommerce_app2/features/auth/cubit/auth_state.dart';
import 'package:ecommerce_app2/features/auth/models/login_response_model.dart';
import 'package:ecommerce_app2/features/auth/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInitial());
  final AuthRepo _authRepo;
  void login({required String username, required String password}) async {
    emit(AuthLoading());

    final Either<String, LoginResponseModel> resp = await _authRepo.login(
      username: username,
      password: password,
    );

    resp.fold(
      (error) {
        if (!isClosed) {
          emit(AuthError('Please Enter Valid Credentials'));
        }
      },
      (response) {
        if (!isClosed) {
          emit(AuthSuccess('Login successful'));
        }
      },
    );
  }
}
