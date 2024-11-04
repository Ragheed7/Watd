import 'package:flutter/material.dart';
import 'package:waie/features/account/presentation/widgets/delivery_address_screen.dart';
import 'package:waie/features/account/presentation/widgets/order_header_screen.dart';
import 'package:waie/features/account/presentation/widgets/order_item_screen.dart';
import 'package:waie/features/account/presentation/widgets/order_summary_screen.dart';

class OrderDetailsScreen extends StatelessWidget {
  final List<String> imageList = [
    "assets/images/Offices.png",
    "assets/images/Bedrooms.jpg",
    "assets/images/Kitchens.jpg",
    "assets/images/living room.png",
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
      "A wooden dining table that brings a cozy and modern feel to any dining room at computer science and also all the world",
    ],
    [
      "A Round wooden dining table",
    ],
    [
      "A wooden dining table with a Scandinavian design that brings a cozy and modern furniture around the world of kitchen",
    ],
    [
      "A Round wooden dining table and living room",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Order details"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(),
                OrderHeader(),
                SizedBox(height: 15),
                DeliveryAddress(),
                SizedBox(height: 20),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Order",
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "4 items",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                ListView.builder(
                  itemCount: imageList.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return OrderItem(
                      image: imageList[index],
                      title: productTitle[index],
                      details: contentDetails[index],
                      price: prices[index],
                    );
                  },
                ),
                SizedBox(height: 20),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Payment",
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
                OrderSummary(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
