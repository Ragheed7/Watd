import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waie/core/di/dependency_injection.dart';
import 'package:waie/core/helpers/constants.dart';
import 'package:waie/core/helpers/extensions.dart';
import 'package:waie/core/helpers/shared_prefs_helper.dart';
import 'package:waie/core/routing/app_router.dart';
import 'package:waie/waie_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  //fixing text hiding bug of screenUtils in release mode
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();
  runApp(Waie(
    appRouter: AppRouter(),
  ));
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
