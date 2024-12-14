import 'package:waie/core/helpers/constants.dart';
import 'package:waie/core/routing/app_router.dart';
import 'package:waie/core/routing/routes.dart';
import 'package:waie/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Waie extends StatelessWidget {
  final bool isLoggedIn;
  final AppRouter appRouter;
  const Waie({super.key, required this.appRouter, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(390, 833),
      child: MaterialApp(
        title: "Waei App",
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
        theme: ThemeData(
          primaryColor: ColorsManager.mainGreen,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: isLoggedIn ? Routes.navigationMenu : Routes.welcomeScreen,
        // initialRoute: Routes.welcomeScreen
      ),
    );
  }
}
