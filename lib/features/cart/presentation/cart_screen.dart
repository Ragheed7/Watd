import 'package:flutter/material.dart';
import 'package:waie/features/account/presentation/widgets/app_bar_screen.dart';
import 'package:waie/features/cart/presentation/widgets/cart_item_screen.dart';
import 'package:waie/features/cart/presentation/widgets/cart_summary_screen.dart';
import 'package:waie/features/cart/presentation/widgets/checkout_button_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<String> imageList = [
    "assets/images/Offices.png",
    "assets/images/Bedrooms.jpg",
    "assets/images/Kitchens.jpg",
    "assets/images/LivingRooms.jpg",
  ];

  final List<String> productTitle = [
    "Office Chair",
    "Bedroom Set",
    "Kitchen Cabinets",
    "Living Room Sofa",
  ];

  final List<String> prices = ["SAR 250", "SAR 300", "SAR 450", "SAR 350"];

  final List<List<String>> contentDetails = [
    [
      "A wooden dining table that brings a cozy and modern feel to any dining room at computer science and also all the world"
    ],
    ["A Round wooden dining table"],
    ["A wooden dining table with a Scandinavian design."],
    [
      "A wooden dining table that brings a cozy and modern feel to any dining room at computer science and also all the world"
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarScreen(title: 'Cart'),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(),
                SizedBox(height: 10),
                CartSummaryScreen(),
                SizedBox(height: 15),
                ListView.builder(
                  itemCount: imageList.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CartItemScreen(
                      image: imageList[index],
                      title: productTitle[index],
                      price: prices[index],
                      details: contentDetails[index],
                    );
                  },
                ),
                SizedBox(height: 100),
                CheckoutButtonScreen(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
