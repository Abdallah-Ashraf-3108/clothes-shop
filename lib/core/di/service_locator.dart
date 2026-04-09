import 'package:ecommerce_app2/core/networking/dio_helper.dart';
import 'package:ecommerce_app2/core/networking/storage_helper.dart';
import 'package:ecommerce_app2/features/auth/cubit/auth_cubit.dart';
import 'package:ecommerce_app2/features/auth/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  DioHelper dioHelper = DioHelper();

  //DioHelper
  locator.registerSingleton<DioHelper>(dioHelper);

  //StorageHelper
  locator.registerLazySingleton(() => StorageHelper());

  //Repositories
  locator.registerLazySingleton(() => AuthRepo(locator()));

  //Cubits
  locator.registerFactory(() => AuthCubit(locator()));
}
