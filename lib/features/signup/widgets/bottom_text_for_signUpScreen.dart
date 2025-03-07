import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watd/core/helpers/spacing.dart';
import 'package:watd/core/routing/routes.dart';
import 'package:watd/core/theming/colors.dart';

class BottomTextButtonsInSignUpScreen extends StatelessWidget {
  const BottomTextButtonsInSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              // 'Contact us' 
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Having issue? ',
                  style: TextStyle(
                    fontFamily: 'cabin',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: ColorsManager.secondaryGrey,
                  ),
                ),
                Text(
                  'Contact us',
                  style: TextStyle(
                    fontFamily: 'cabin',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.mainGreen,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(Routes.loginScreen);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account? ',
                  style: TextStyle(
                    fontFamily: 'cabin',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: ColorsManager.secondaryGrey,
                  ),
                ),
                Text(
                  'Register here',
                  style: TextStyle(
                    fontFamily: 'cabin',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.mainGreen,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
