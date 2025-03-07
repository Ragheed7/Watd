import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watd/core/di/dependency_injection.dart';
import 'package:watd/core/routing/routes.dart';
import 'package:watd/features/OnBoarding/landing_screen.dart';
import 'package:watd/features/OnBoarding/welcome_screen.dart';
import 'package:watd/features/account/presentation/myaccount.dart';
import 'package:watd/features/home/presentation/home_screen.dart';
import 'package:watd/features/login/logic/cubit/login_cubit.dart';
import 'package:watd/features/login/presentation/login_screen.dart';
import 'package:watd/features/otp/otp_screen.dart';
import 'package:watd/features/signup/signup_screen.dart';
import 'package:watd/navigation_menu.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const LandingScreen(),
        );

      case Routes.welcomeScreen:
        return MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        );

      case Routes.signupScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const SignupScreen(),
                ));

      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginScreen(),
                ));

      case Routes.otpScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        final phoneNumber = args?['phoneNumber'] ?? '';

        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: OTPScreen(phoneNumber: phoneNumber),
                ));

      case Routes.navigationMenu:
        return MaterialPageRoute(
            builder: (context) => const BottomNavBar());

      case Routes.myAccountScreen:
        return MaterialPageRoute(
            builder: (context) => const MyaccountScreen());

      // case Routes.cartScreen:
      // return MaterialPageRoute(
      //   builder: (context) => BlocProvider(
      //     create: (context) => getIt<CartCubit>()..fetchCartItems(),
      //     child: const CartScreen(),
      // ));

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );

      // case Routes.productsScreen:
      // return MaterialPageRoute(
      //   builder: (context) => ProductsListScreen(),
      // );

      default:
        return null;
    }
  }
}

// builder: (context) => BlocProvider(
//   create: (context) => HomeCubit(getIt())..getSpecializations(),
//   child: const HomeScreen(),


// otp 
// final args = settings.arguments as Map<String, dynamic>?;
// final phoneNumber = args?['phoneNumber'] ?? '';

// return MaterialPageRoute(
//   builder: (context) => BlocProvider(
//     create: (context) => getIt<LoginCubit>(),
//     child: OTPScreen(phoneNumber: phoneNumber),
// )