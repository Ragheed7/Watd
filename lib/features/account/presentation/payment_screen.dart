import 'package:flutter/material.dart';
import 'package:waie/features/account/presentation/add_new_payment_screen.dart';
import 'package:waie/features/account/presentation/edit_payment_screen.dart';
import 'package:waie/features/account/presentation/widgets/add_new_payment_button_screen.dart';
import 'package:waie/features/account/presentation/widgets/app_bar_screen.dart';
import 'package:waie/features/account/presentation/widgets/payment_card_screen.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarScreen(title: "Payment"),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(),
                SizedBox(height: 10),
                Text(
                  "Payment",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 15),
                PaymentCardScreen(
                  cardNumber: "4123 1232 4231 2341",
                  cardHolderName: "karem maged",
                  expiryDate: "12/25",
                ),
                SizedBox(height: 100),
                AddNewPaymentButtonScreen(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
