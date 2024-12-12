import 'package:flutter/material.dart';
import 'package:waie/core/theming/colors.dart';

class BuyButtonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: () {},
        color: ColorsManager.mainGreen,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1,
          vertical: 16,
        ),
        child: Text(
          'Buy now',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'cabin',
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        minWidth: MediaQuery.of(context).size.width * 0.8,
      ),
    );
  }
}
