import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waie/core/Notifications/notification_manager.dart';
import 'package:waie/core/Notifications/signalr_service.dart';
import 'package:waie/core/di/dependency_injection.dart';
import 'package:waie/core/helpers/constants.dart';
import 'package:waie/core/helpers/shared_prefs_helper.dart';
import 'package:waie/core/routing/app_router.dart';
import 'package:waie/core/shared_models/user_addresses/logic/address_cubit.dart';
import 'package:waie/core/shared_models/user_data/user_data.dart';
import 'package:waie/features/account/presentation/widgets/user_info/logic/update_user_cubit.dart';
import 'package:waie/features/auth/repo/auth_repo.dart';
import 'package:waie/features/cart/data/model/selected_address_and_payment/selected_addresses_cubit.dart';
import 'package:waie/features/cart/data/model/selected_address_and_payment/selected_payment_card_cubit.dart';
import 'package:waie/features/cart/data/repository/order_repo.dart';
import 'package:waie/features/cart/logic/cart_cubit.dart';
import 'package:waie/features/cart/logic/order%20logic/create_order_cubit.dart';
import 'package:waie/features/cart/logic/order%20logic/pay_order_cubit.dart';
import 'package:waie/features/home/logic/cubit/create_service_cubit.dart';
import 'package:waie/features/login/logic/cubit/user_cubit.dart';
import 'package:waie/waie_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  //fixing text hiding bug of screenUtils in release mode
  await ScreenUtil.ensureScreenSize();
  // await NotificationManager.init();
  // getIt<SignalRService>();
  // await checkIfLoggedInUser();
  // Load UserData and update UserCubit
  // if (isLoggedInUser) {
  //   await loadUserData();
  // }

  AuthRepository authRepository = getIt<AuthRepository>();

  // Check and refresh token if necessary
  bool isUserLoggedIn = await checkAndRefreshToken(authRepository);

  // Load UserData and update UserCubit if the login is valid
  if (isUserLoggedIn) {
    await loadUserData();
  }

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<AddressCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<UserCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<UpdateUserCubit>(),
        ),
        BlocProvider<CartCubit>(
          create: (_) => getIt<CartCubit>()..fetchCartItems(),
        ),
        BlocProvider<SelectedAddressCubit>(
          create: (context) => SelectedAddressCubit(),
        ),
        BlocProvider<SelectedPaymentCardCubit>(
          create: (context) => SelectedPaymentCardCubit(),
        ),
        BlocProvider<CreateOrderCubit>(
          create: (context) => CreateOrderCubit(getIt<OrderRepo>()),
        ),
        BlocProvider<PayOrderCubit>(
          create: (context) => PayOrderCubit(getIt<OrderRepo>()),
        ),
        BlocProvider<CreateServiceCubit>(
          create: (_) => getIt<CreateServiceCubit>(),
        ),
      ],
      child: Waie(
        appRouter: AppRouter(), isLoggedIn: isUserLoggedIn
      ),
    ),
  );
}

Future<void> loadUserData() async {
  try {
    final userJson =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userData);
    print('Loaded userJson: $userJson');
    if (userJson != null && userJson.isNotEmpty) {
      final userMap = jsonDecode(userJson);
      final userData = UserData.fromJson(userMap);
      final userCubit = getIt<UserCubit>();
      userCubit.setUser(userData);
    } else {
      print('No user data found in storage.');
    }
  } catch (e) {
    print('Error loading user data: $e');
  }
}

// checkIfLoggedInUser() async {
//   String? userToken =
//       await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
//   if (!userToken.isNullOrEmpty()) {
//     isLoggedInUser = true;
//   } else {
//     isLoggedInUser = false;
//   }
// }

Future<bool> checkAndRefreshToken(AuthRepository authRepository) async {
  final accessTokenExpiryString = await SharedPrefHelper.getSecuredString(SharedPrefKeys.accessTokenExpiry);
  final DateTime accessTokenExpiry = accessTokenExpiryString != null
    ? DateTime.parse(accessTokenExpiryString)
    : DateTime.now().subtract(const Duration(days: 1)); // expired if not found

  Duration timeUntilExpiration = accessTokenExpiry.difference(DateTime.now());

  // Printing how much time is left until the token expires
  if (timeUntilExpiration.isNegative) {
    print("Token has already expired.");
  } else {
    print("Token expires in: ${timeUntilExpiration.inHours} hours and ${timeUntilExpiration.inMinutes % 60} minutes.");
  }

  print("Checking token expiry");
  if (DateTime.now().isAfter(accessTokenExpiry)) {
    print("Token is expired, refreshing...");
    bool refreshResult = await authRepository.refreshToken();
    if (!refreshResult) {
      print("Token refresh failed, logging out...");
      return false;
    }
    return true;
  } else {
    print("Token is still valid");
    return true;
  }
}
