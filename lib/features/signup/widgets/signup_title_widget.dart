import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpTitleWidget extends StatelessWidget {
  const SignUpTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30),
      alignment: Alignment.topLeft,
      child: Text(
        'Sign Up',
        style: TextStyle(
          fontFamily: 'cabin',
          fontSize: 32,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
