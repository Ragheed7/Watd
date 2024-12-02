import 'package:flutter/material.dart';

class PaymentSuccessScreen extends StatelessWidget {
  final int orderId;

  const PaymentSuccessScreen({Key? key, required this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Remove the back button to prevent navigating back to the confirmation screen
      appBar: AppBar(
        title: Text("Payment Successful"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text(
          "Your payment for Order #$orderId was successful!",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,  
        ),
      ),
    );
  }
}
