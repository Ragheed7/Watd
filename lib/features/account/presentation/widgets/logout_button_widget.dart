import 'package:flutter/material.dart';

class LogoutButtonWidget extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final VoidCallback onPressed;

  const LogoutButtonWidget({
    super.key,
    required this.buttonText,
    required this.buttonColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: onPressed,
        color: buttonColor,
        padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 16),
        child: Text(
          buttonText,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'cabin',
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}
