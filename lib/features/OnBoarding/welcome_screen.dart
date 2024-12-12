import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waie/core/helpers/constants.dart';
import 'package:waie/core/helpers/spacing.dart';
import 'package:waie/core/routing/routes.dart';
import 'package:waie/core/theming/colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(200),
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Image.asset(ImageLoader.logoWthoutName),
              width: 300,
              height: 200,
            ),
            // Container(
            //   padding: const EdgeInsets.all(20),
            //   child: Image.asset(ImageLoader.enviroment), width: 300, height: 300,
            // ),
            Container(height: 60),
            Text(
              'Welcome to Waei',
              style: TextStyle(
                fontFamily: 'cabin',
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            verticalSpace(10),
            Container(
              child: Text(
                'Your Eco-Friendly Marketplace!',
                style: TextStyle(
                  fontFamily: 'cabin',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            verticalSpace(45),
            Container(
              width: 358,
              height: 48,
              padding: EdgeInsets.symmetric(horizontal: 70),
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.loginScreen);
                },
                color: ColorsManager.mainGreen,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Get started  ',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'cabin',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 30,
                    )
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      12.0), 
                ),
              ),
            ),
            Container(
              height: 10,
            ),
            // TextButton(
            //   onPressed: () {
            //     Navigator.of(context).pushNamed(Routes.loginScreen);
            //   },
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(
            //         'already have an account? ',
            //         style: TextStyle(
            //             fontFamily: 'cabin',
            //             fontSize: 16,
            //             fontWeight: FontWeight.w400,
            //             color: Color.fromRGBO(86, 86, 86, 1)),
            //       ),
            //       Text(
            //         'Sign-in',
            //         style: TextStyle(
            //             fontFamily: 'cabin',
            //             fontSize: 16,
            //             fontWeight: FontWeight.w500,
            //             color: ColorsManager.mainGreen),
            //       ),
            //     ],
            //   ),
            // ),
            // TextButton(
            //   onPressed: () {
            //     Navigator.of(context).pushReplacementNamed(Routes.navigationMenu);
            //   },
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(
            //         'Continue as a ',
            //         style: TextStyle(
            //             fontFamily: 'cabin',
            //             fontSize: 16,
            //             fontWeight: FontWeight.w400,
            //             color: Color.fromRGBO(86, 86, 86, 1)),
            //       ),
            //       Text(
            //         'guest',
            //         style: TextStyle(
            //             fontFamily: 'cabin',
            //             fontSize: 16,
            //             fontWeight: FontWeight.w500,
            //             color: ColorsManager.mainGreen),
            //       ),
            //     ],
            //   ),
            // ),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}
