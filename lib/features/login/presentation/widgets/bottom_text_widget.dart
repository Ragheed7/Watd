import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waie/core/helpers/spacing.dart';
import 'package:waie/core/routing/routes.dart';
import 'package:waie/core/theming/colors.dart';

class BottomTextButtonsWidget extends StatelessWidget {
  const BottomTextButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorsManager.secondaryGrey,
                ),
              ),
              Text(
                'Contact us',
                style: TextStyle(
                  fontFamily: 'cabin',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorsManager.mainGreen,
                ),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.signupScreen);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account? ',
                style: TextStyle(
                  fontFamily: 'cabin',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorsManager.secondaryGrey,
                ),
              ),
              Text(
                'Register here',
                style: TextStyle(
                  fontFamily: 'cabin',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorsManager.mainGreen,
                ),
              ),
            ],
          ),
        ),
        verticalSpace(16),
      ],
    );
  }
}
