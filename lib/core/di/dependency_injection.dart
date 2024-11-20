import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:waie/core/networking/api_service.dart';
import 'package:waie/core/networking/dio_factory.dart';
import 'package:waie/features/auth/interceptor/auth_interceptor.dart';
import 'package:waie/features/auth/repo/auth_repo.dart';
import 'package:waie/features/home/data/repository/home_repo.dart';
import 'package:waie/features/home/logic/cubit/home_cubit.dart';
import 'package:waie/features/login/data/repository/login_repo.dart';
import 'package:waie/features/login/logic/cubit/login_cubit.dart';
import 'package:waie/features/login/logic/cubit/user_cubit.dart';
import 'package:waie/features/products_list/data/repository/product_repo.dart';
import 'package:waie/features/products_list/logic/cubit/product_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // 1. Initialize Dio
  Dio dio = await DioFactory.getDio();

  // 2. Register ApiService
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // 3. Register LoginRepo and LoginCubit
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // 4. Register AuthRepository
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(getIt<ApiService>()));

  // 5. Add AuthInterceptor **After** AuthRepository is registered
  dio.interceptors.add(AuthInterceptor(getIt<AuthRepository>()));

  // 6. Register HomeRepo and HomeCubit
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  // 7. Register ProductRepo and ProductCubit
  getIt.registerLazySingleton<ProductRepo>(() => ProductRepo(getIt()));
  getIt.registerFactory<ProductCubit>(() => ProductCubit(getIt()));

  // 8. Register UserCubit
  getIt.registerLazySingleton<UserCubit>(() => UserCubit());
}
