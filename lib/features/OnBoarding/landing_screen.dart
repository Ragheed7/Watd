import 'package:flutter/material.dart';
import 'package:waie/core/helpers/constants.dart';
import 'package:waie/features/OnBoarding/welcome_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
@override
  void initState() {
    super.initState();
    // Set a timer to navigate after 800ms
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) { // Check if the widget is still in the tree
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(40),
              child: Image.asset(ImageLoader.logo),
            ),
            
          ],
        ),
      ),
    );
  }
}
