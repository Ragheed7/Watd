import 'package:flutter/material.dart';
import 'package:waie/core/helpers/spacing.dart';
import 'package:waie/core/local_models/payment_model/payment_card.dart';
import 'package:waie/core/local_models/payment_model/payment_card_manager.dart';
import 'package:waie/features/account/presentation/add_new_payment_screen.dart';
import 'package:waie/features/account/presentation/widgets/payment_card_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  List<PaymentCard> paymentCards = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPaymentCards();
  }

  Future<void> _loadPaymentCards() async {
    await PaymentCardManager().loadPaymentCards();
    setState(() {
      paymentCards = PaymentCardManager().paymentCards;
      isLoading = false;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      paymentCards = PaymentCardManager().paymentCards;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text("Payment"),  backgroundColor: Colors.white),
        backgroundColor: Colors.white,
        body: Center(child: CircularProgressIndicator()),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text("Payment"), backgroundColor: Colors.white,),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: paymentCards.isEmpty
                  ? SizedBox(
                      height: 600,
                      child: Column(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: FractionalOffset.center,
                              child: Text(
                                'No payment cards found.',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          // Add New Payment Button
                          Expanded(
                            child: Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: MaterialButton(
                                onPressed: () async {
                                  bool? result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AddNewPaymentScreen(),
                                    ),
                                  );
                                  if (result == true) {
                                    setState(() {
                                      paymentCards =
                                          PaymentCardManager().paymentCards;
                                    });
                                  }
                                },
                                color: Color.fromRGBO(118, 192, 67, 1),
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.1,
                                  vertical: 16,
                                ),
                                child: Text(
                                  '+ Add new payment',
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
                                minWidth:
                                    MediaQuery.of(context).size.width * 0.8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Divider(),
                        SizedBox(height: 10),
                        Text(
                          "My Payment Cards",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 15),
                        // Display the list of payment cards
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: paymentCards.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                PaymentCardScreen(
                                  cardNumber: paymentCards[index].cardNumber,
                                  cardHolderName:
                                      paymentCards[index].cardHolderName,
                                  expiryMonth: paymentCards[index].expiryMonth,
                                  expiryYear: paymentCards[index].expiryYear,
                                  cardIndex: index,
                                  onDelete: () {
                                    setState(() {
                                      paymentCards =
                                          PaymentCardManager().paymentCards;
                                    });
                                  },
                                ),
                                SizedBox(height: 15),
                              ],
                            );
                          },
                        ),
                        SizedBox(height: 10),
                        // Add New Payment Button
                        Center(
                          child: MaterialButton(
                            onPressed: () async {
                              bool? result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddNewPaymentScreen(),
                                ),
                              );
                              if (result == true) {
                                setState(() {
                                  paymentCards =
                                      PaymentCardManager().paymentCards;
                                });
                              }
                            },
                            color: Color.fromRGBO(118, 192, 67, 1),
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.1,
                              vertical: 16,
                            ),
                            child: Text(
                              '+ Add new payment',
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
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
            ),
          ),
        ),
      );
    }
  }
}
