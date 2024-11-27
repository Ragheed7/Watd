import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/features/cart/data/model/order_models/pay_order_request.dart';
import 'package:waie/features/cart/logic/order%20logic/pay_order_cubit.dart';
import 'package:waie/features/cart/logic/order%20logic/pay_order_state.dart';
import 'package:waie/features/cart/presentation/widgets/payment_success_screen.dart';
import 'package:waie/features/cart/data/model/selected_address_and_payment/selected_payment_card_cubit.dart';

class OrderConfirmationScreen extends StatefulWidget {
  final int orderId;

  const OrderConfirmationScreen({Key? key, required this.orderId}) : super(key: key);

  @override
  State<OrderConfirmationScreen> createState() => _OrderConfirmationScreenState();
}

class _OrderConfirmationScreenState extends State<OrderConfirmationScreen> {
  void _confirmPayment() async {
    final payOrderCubit = context.read<PayOrderCubit>();
    final selectedPaymentCardState = context.read<SelectedPaymentCardCubit>().state;

    // Validate selected payment card
    if (selectedPaymentCardState is! PaymentCardSelected) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No payment method selected.")),
      );
      return;
    }

    final selectedCard = selectedPaymentCardState.selectedCard;

    // Collect CVV from the user
    String cvv = await _askForCvv();
    if (cvv.isEmpty) return; // User canceled or invalid CVV

    final payOrderRequest = PayOrderRequest(
      creditCardNumber: selectedCard.cardNumber,
      cardholderName: selectedCard.cardHolderName,
      expirationDate:
          "${selectedCard.expiryMonth.toString().padLeft(2, '0')}/${selectedCard.expiryYear.toString().padLeft(2, '0')}",
      cvv: cvv,
      cash: false, // Adjust based on your logic
    );

    // Dispatch PayOrder
    payOrderCubit.payOrder(widget.orderId, payOrderRequest);
  }

  Future<String> _askForCvv() async {
    String cvv = '';
    bool isValid = false;
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Enter CVV"),
          content: TextField(
            keyboardType: TextInputType.number,
            maxLength: 3,
            onChanged: (value) {
              cvv = value;
              isValid = RegExp(r'^\d{3}$').hasMatch(cvv);
            },
            decoration: InputDecoration(
              hintText: "CVV",
              counterText: "",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (isValid) {
                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please enter a valid CVV.")),
                  );
                }
              },
              child: Text("Confirm"),
            ),
          ],
        );
      },
    );
    return isValid ? cvv : '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Confirmation"),
      ),
      body: BlocListener<PayOrderCubit, PayOrderState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            loading: () {
              // Show loading indicator
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => Center(child: CircularProgressIndicator()),
              );
            },
            success: (payOrderResponse) {
              Navigator.of(context).pop(); // Remove loading dialog
              if (payOrderResponse.isSuccess) {
                // Assume the backend clears the cart upon successful payment
                // Therefore, fetching cart items should return an empty list
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Payment Successful!")),
                );
                // Navigate to Payment Success Screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentSuccessScreen(orderId: payOrderResponse.result.orderId),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(payOrderResponse.message)),
                );
              }
            },
            failure: (error) {
              Navigator.of(context).pop(); // Remove loading dialog
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(error)),
              );
            },
          );
        },
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "Your order has been created successfully!",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _confirmPayment,
                child: Text("Confirm Payment"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(118, 192, 67, 1),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
