// payment_card.dart
import 'package:flutter/material.dart';
import 'package:waie/features/account/presentation/edit_payment_screen.dart';

class PaymentCard extends StatelessWidget {
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;

  const PaymentCard({
    Key? key,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18),
      width: MediaQuery.of(context).size.width,
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cardNumber,
                style: TextStyle(fontSize: 16),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditPaymentScreen(),
                    ),
                  );
                },
                child: Text(
                  "Edit",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(118, 192, 67, 1),
                  ),
                ),
              ),
            ],
          ),
          Text(
            cardHolderName,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 4),
          Text(
            "Exp $expiryDate",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
