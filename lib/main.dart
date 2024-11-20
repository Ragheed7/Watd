import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waie/core/di/dependency_injection.dart';
import 'package:waie/core/helpers/constants.dart';
import 'package:waie/core/helpers/extensions.dart';
import 'package:waie/core/helpers/shared_prefs_helper.dart';
import 'package:waie/core/routing/app_router.dart';
import 'package:waie/core/shared_models/user_data/user_data.dart';
import 'package:waie/features/login/logic/cubit/user_cubit.dart';
import 'package:waie/waie_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  //fixing text hiding bug of screenUtils in release mode
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();
   // Load UserData and update UserCubit
  if (isLoggedInUser) {
    await loadUserData();
  }
  runApp(Waie(
    appRouter: AppRouter(),
  ));
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


checkIfLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
