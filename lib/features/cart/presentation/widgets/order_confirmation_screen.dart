import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watd/core/helpers/constants.dart';
import 'package:watd/core/theming/colors.dart';
import 'package:watd/features/account/presentation/payment_screen.dart';
import 'package:watd/features/cart/data/model/order_models/pay_order_request.dart';
import 'package:watd/features/cart/data/model/order_models/sub_order_models/order.dart';
import 'package:watd/features/cart/data/model/selected_address_and_payment/selected_payment_card_cubit.dart';
import 'package:watd/features/cart/logic/order%20logic/pay_order_cubit.dart';
import 'package:watd/features/cart/logic/order%20logic/pay_order_state.dart';
import 'package:watd/features/cart/presentation/widgets/payment_success_screen.dart';
import 'package:watd/features/cart/presentation/widgets/payment_section_screen.dart';
import 'package:watd/features/cart/presentation/widgets/order_summary_screen.dart';
import 'package:watd/features/cart/presentation/widgets/cart_item_screen.dart';
import 'package:watd/features/login/logic/cubit/user_cubit.dart';

class OrderConfirmationScreen extends StatefulWidget {
  final Order order;

  const OrderConfirmationScreen({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<OrderConfirmationScreen> createState() =>
      _OrderConfirmationScreenState();
}

class _OrderConfirmationScreenState extends State<OrderConfirmationScreen> {
  String _cvv = '';
  final _formKey = GlobalKey<FormState>();

  void _handleCvvChange(String cvv) {
    setState(() {
      _cvv = cvv;
    });
  }

  void _processPayment() async {
    // Validate selected payment card
    final selectedPaymentCardState =
        context.read<SelectedPaymentCardCubit>().state;
    if (selectedPaymentCardState is! PaymentCardSelected) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select a payment method.")),
      );
      return;
    }

    // Validate CVV
    if (_cvv.isEmpty || !RegExp(r'^\d{3,4}$').hasMatch(_cvv)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a valid CVV.")),
      );
      return;
    }

    // Proceed to pay for the order
    await _payForOrder();
  }

  Future<void> _payForOrder() async {
    final payOrderCubit = context.read<PayOrderCubit>();
    final selectedPaymentCardState =
        context.read<SelectedPaymentCardCubit>().state;
    final selectedCard =
        (selectedPaymentCardState as PaymentCardSelected).selectedCard;
    // Remove all spaces from the card number
    String sanitizedCardNumber = selectedCard.cardNumber.replaceAll(' ', '');

    // Validate the sanitized card number
    if (sanitizedCardNumber.length != 16 ||
        !RegExp(r'^\d{16}$').hasMatch(sanitizedCardNumber)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text("Please enter a valid 16-digit credit card number.")),
      );
      return;
    }
    String formattedDate =
        "${selectedCard.expiryYear.toString().padLeft(4, '0')}-${selectedCard.expiryMonth.toString().padLeft(2, '0')}-01";

    final payOrderRequest = PayOrderRequest(
      creditCardNumber: sanitizedCardNumber,
      cardholderName: selectedCard.cardHolderName,
      expirationDate: formattedDate,
      cvv: _cvv,
    );

    // Dispatch PayOrder
    payOrderCubit.payOrder(widget.order.orderId, payOrderRequest);
  }

  @override
  Widget build(BuildContext context) {
    // Calculate totals
    double itemsTotal = 0;
    for (var item in widget.order.orderItems) {
      if (item.product.price != null) {
        itemsTotal += item.product.price!;
      }
    }
    double totalPayment = itemsTotal + SharedPrefKeys.deliveryFee;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order Confirmation",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: MultiBlocListener(
        listeners: [
          // Listener for PayOrderCubit
          BlocListener<PayOrderCubit, PayOrderState>(
            listener: (context, state) {
              state.when(
                initial: () {},
                loading: () {
                  // Show loading indicator
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => Center(child: CircularProgressIndicator(color: ColorsManager.mainGreen,)),
                  );
                },
                success: (payOrderResponse) {
                  Navigator.of(context).pop(); // Remove loading dialog
                  if (payOrderResponse.isSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Payment Successful!")),
                    );

                    // Navigate to Payment Success Screen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentSuccessScreen(
                          orderId: payOrderResponse.result.orderId,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(payOrderResponse.message ??
                              "Payment was unsuccessful. Please try again.")),
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
          ),
        ],
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Order Details Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order Details",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10),
                        ListView.builder(
                          itemCount: widget.order.orderItems.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final product =
                                widget.order.orderItems[index].product;
                            return CartItemScreen(
                              product: product,
                              showDeleteButton: false,
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    // Payment Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Payment",
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w600),
                        ),
                        TextButton(
                          onPressed: () async {
                            // Retrieve userId from UserCubit
                            final userCubit = context.read<UserCubit>();
                            final userId = userCubit.state?.userId;

                            if (userId == null || userId.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("User not logged in.")),
                              );
                              return;
                            }

                            // Navigate to PaymentScreen with userId
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentScreen(
                                  isSelection: true,
                                  userId: userId,
                                ),
                              ),
                            );
                            // The SelectedPaymentCardCubit will handle the selection
                          },
                          child: Text(
                            "Change",
                            style: TextStyle(
                              fontSize: 14,
                              color: ColorsManager.mainGreen,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    // Display Selected Payment Card
                    BlocBuilder<SelectedPaymentCardCubit, PaymentCardState>(
                      builder: (context, state) {
                        if (state is PaymentCardSelected) {
                          return PaymentSectionScreen(
                            paymentCard: state.selectedCard,
                            onCvvChanged: _handleCvvChange,
                          );
                        } else {
                          return Center(
                              child: Text("No payment card selected"));
                        }
                      },
                    ),
                    SizedBox(height: 40),
                    // Order Summary
                    OrderSummaryScreen(
                      itemsTotal: itemsTotal,
                      deliveryFee: SharedPrefKeys.deliveryFee,
                      totalPayment: totalPayment,
                    ),
                    SizedBox(height: 20),
                    // Confirm Payment Button
                    Center(
                      child: ElevatedButton(
                        onPressed: (_cvv.isNotEmpty &&
                                RegExp(r'^\d{3,4}$').hasMatch(_cvv))
                            ? () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.white,
                                      title: Text('Confirm Payment'),
                                      content: Text(
                                          'Are you sure you want to proceed with this payment?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // Close the dialog
                                          },
                                          child: Text(
                                            'Cancel',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // Close the dialog
                                            _processPayment(); // Call the payment processing function
                                          },
                                          child: Text(
                                            'Confirm',
                                            style:
                                                TextStyle(color: ColorsManager.mainGreen),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManager.mainGreen,
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.22,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: Text(
                          'Confirm Payment',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
