import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:waie/core/networking/api_service.dart';
import 'package:waie/core/networking/dio_factory.dart';
import 'package:waie/features/login/data/repository/login_repo.dart';
import 'package:waie/features/login/logic/cubit/login_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio and ApiService
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}