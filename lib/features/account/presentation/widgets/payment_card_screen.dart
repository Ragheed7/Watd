import 'package:flutter/material.dart';
import 'package:waie/core/local_models/payment_model/payment_card_manager.dart';
import 'package:waie/features/account/presentation/edit_payment_screen.dart';

class PaymentCardScreen extends StatelessWidget {
  final String cardNumber;
  final String cardHolderName;
  final int expiryMonth;
  final int expiryYear;
  final int cardIndex;
  final VoidCallback onDelete;

  const PaymentCardScreen({
    Key? key,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryMonth,
    required this.expiryYear,
    required this.cardIndex,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18),
      width: MediaQuery.of(context).size.width,
      height: 140,
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
          // Card Details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Card ${cardIndex+1}",
                style: TextStyle(fontSize: 18),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () async {
                      bool? result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditPaymentScreen(
                            cardIndex: cardIndex,
                          ),
                        ),
                      );
                      if (result == true) {
                        (context as Element).markNeedsBuild();
                      }
                    },
                    child: Text(
                      "Edit",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(118, 192, 67, 1),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      await PaymentCardManager().deletePaymentCard(cardIndex);
                      onDelete();
                    },
                  ),
                ],
              ),
            ],
          ),
          
          Text(
            cardNumber,
            style: TextStyle(fontSize: 16),
          ),
          Text(
            cardHolderName,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 4),
          Text(
            "Exp ${expiryMonth.toString().padLeft(2, '0')}/${expiryYear.toString().padLeft(2, '0')}",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
