import 'package:flutter/material.dart';
import 'package:waie/features/account/presentation/widgets/app_bar_screen.dart';
import 'package:waie/features/account/presentation/widgets/order_summary_screen.dart';
import 'package:waie/features/cart/presentation/widgets/buy_button_screen.dart';
import 'package:waie/features/cart/presentation/widgets/cart_section_screen.dart';
import 'package:waie/features/cart/presentation/widgets/delivery_address_section_screen.dart';
import 'package:waie/features/cart/presentation/widgets/payment_section_screen.dart';

class CheckOutScreen extends StatelessWidget {
  final List<String> imageList = [
    "assets/images/img1.jpg",
    "assets/images/img2.jpg",
    "assets/images/img3.jpg",
    "assets/images/img4.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarScreen(title: 'Checkout'),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CartSectionScreen(imageList: imageList),
                SizedBox(height: 50),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delivery address",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w600)),
                    TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => (),
                        //     ));
                      },
                      child: Text(
                        "Change",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(118, 192, 67, 1),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                DeliveryAddressSectionScreen(),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Payment",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w600)),
                    TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => (),
                        //     ));
                      },
                      child: Text(
                        "Change",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(118, 192, 67, 1),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                PaymentSectionScreen(),
                SizedBox(height: 40),
                OrderSummaryScreen(),
                SizedBox(height: 100),
                BuyButtonScreen(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
