import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:watd/core/Notifications/signalr_service.dart';
import 'package:watd/core/networking/api_service.dart';
import 'package:watd/core/networking/dio_factory.dart';
import 'package:watd/core/shared_models/look_ups/logic/lookup_cubit.dart';
import 'package:watd/core/shared_models/look_ups/repository/lookup_repo.dart';
import 'package:watd/core/shared_models/user_addresses/data/repository/address_repo.dart';
import 'package:watd/core/shared_models/user_addresses/logic/address_cubit.dart';
import 'package:watd/features/account/presentation/widgets/user_info/data/repository/update_user_repo.dart';
import 'package:watd/features/account/presentation/widgets/user_info/logic/update_user_cubit.dart';
import 'package:watd/features/auth/repo/auth_repo.dart';
import 'package:watd/features/cart/data/repository/cart_repo.dart';
import 'package:watd/features/cart/logic/order%20logic/get_orders_cubit.dart';
import 'package:watd/features/cart/data/repository/order_repo.dart';
import 'package:watd/features/cart/logic/cart_cubit.dart';
import 'package:watd/features/cart/logic/order%20logic/create_order_cubit.dart';
import 'package:watd/features/cart/logic/order%20logic/pay_order_cubit.dart';
import 'package:watd/features/home/data/repository/create_service_repo.dart';
import 'package:watd/features/home/data/repository/get_user_services_repo.dart';
import 'package:watd/features/home/data/repository/home_repo.dart';
import 'package:watd/features/home/logic/cubit/create_service_cubit.dart';
import 'package:watd/features/home/logic/cubit/get_user_services_cubit.dart';
import 'package:watd/features/home/logic/cubit/home_cubit.dart';
import 'package:watd/features/login/data/repository/login_repo.dart';
import 'package:watd/features/login/logic/cubit/login_cubit.dart';
import 'package:watd/features/login/logic/cubit/user_cubit.dart';
import 'package:watd/features/product_screen/logic/similar_products_cubit.dart';
import 'package:watd/features/products_list/data/repository/product_repo.dart';
import 'package:watd/features/products_list/logic/cubit/product_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Initialize Dio using DioFactory
  Dio dio = await DioFactory.getDio();

  // Register ApiService
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Register AuthRepository
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepository(getIt<ApiService>()));
  
//   getIt.registerLazySingleton<SignalRService>(
//   () => SignalRService(getIt<AuthRepository>())
// );

  // Register LoginRepo and LoginCubit
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiService>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));

  // Register HomeRepo and HomeCubit
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt<ApiService>()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));

  // Register ProductRepo and ProductCubit
  getIt.registerLazySingleton<ProductRepo>(
      () => ProductRepo(getIt<ApiService>()));
  getIt.registerFactory<ProductCubit>(() => ProductCubit(getIt<ProductRepo>()));

  getIt.registerFactory<SimilarProductsCubit>(() => SimilarProductsCubit(getIt<ProductRepo>()));

  // Register UserCubit
  getIt.registerLazySingleton<UserCubit>(() => UserCubit());

  // Register UpdateUserRepo and UpdateUserCubit
  getIt.registerLazySingleton<UpdateUserRepo>(
      () => UpdateUserRepo(getIt<ApiService>()));
  getIt.registerFactory<UpdateUserCubit>(
      () => UpdateUserCubit(getIt<UpdateUserRepo>()));

  // Register AddreessRepo and AddressCubit 
  getIt.registerLazySingleton<AddressRepo>(
      () => AddressRepo(getIt<ApiService>()));
  getIt.registerFactory<AddressCubit>(() => AddressCubit(getIt<AddressRepo>()));

  // Register CartRepo and CartCubit
  getIt.registerLazySingleton<CartRepo>(() => CartRepo(getIt<ApiService>()));
  getIt.registerFactory<CartCubit>(() => CartCubit(getIt<CartRepo>()));

  // Register OrderRepo, and Create and pay order cubits
  getIt.registerLazySingleton<OrderRepo>(() => OrderRepo(getIt<ApiService>()));
  getIt.registerFactory<CreateOrderCubit>(
      () => CreateOrderCubit(getIt<OrderRepo>()));
  getIt.registerFactory<PayOrderCubit>(() => PayOrderCubit(getIt<OrderRepo>()));

  // Register GetOrdersCubit
  getIt.registerFactory<GetOrdersCubit>(
      () => GetOrdersCubit(getIt<OrderRepo>()));

  // Register CreateService
  getIt.registerLazySingleton<CreateServiceRepository>(
      () => CreateServiceRepository(getIt<ApiService>()));
  getIt.registerFactory<CreateServiceCubit>(
      () => CreateServiceCubit(getIt<CreateServiceRepository>()));

  // Register UserServices repo and cubit
  getIt.registerLazySingleton<GetUserServicesRepository>(
      () => GetUserServicesRepository(getIt<ApiService>()));
  getIt.registerFactory<GetUserServicesCubit>(
      () => GetUserServicesCubit(getIt<GetUserServicesRepository>()));

  // Register LookupRepository and LookupCubit
  getIt.registerLazySingleton<LookupRepository>(
      () => LookupRepository(getIt<ApiService>()));
  getIt.registerFactory<LookupCubit>(
      () => LookupCubit(getIt<LookupRepository>()));
}
