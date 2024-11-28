import 'package:flutter/material.dart';
import 'package:waie/core/helpers/constants.dart';
import 'package:waie/core/networking/api_constants.dart';
import 'package:waie/features/account/presentation/widgets/delivery_address_screen.dart';
import 'package:waie/features/account/presentation/widgets/order_header_screen.dart';
import 'package:waie/features/account/presentation/widgets/order_item_screen.dart';
import 'package:waie/features/account/presentation/widgets/order_summary_screen.dart';
import 'package:waie/features/cart/data/model/order_models/sub_order_models/order.dart';

class OrderDetailsScreen extends StatelessWidget {
  final Order order;

  OrderDetailsScreen({required this.order});

  @override
  Widget build(BuildContext context) {
    // Extract data from the order
    final imageList = order.orderItems
        .map((item) => item.product.images!.isNotEmpty
            ? (ApiConsts.serverBaseUrl + item.product.images![0].imageUrl!) 
            : "assets/images/waie2.png")
        .toList();
    final productTitles = order.orderItems.map((item) => item.product.nameEn ?? "Product").toList();
    final prices = order.orderItems.map((item) => "SAR ${item.product.price?.toStringAsFixed(2)}").toList();
    final contentDetails = order.orderItems
        .map((item) => [item.product.descriptionEn ?? "No description available."])
        .toList();

    double totalPayment = order.totalPrice + SharedPrefKeys.deliveryFee;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Order Details"),
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
                OrderHeaderScreen(order: order),
                SizedBox(height: 15),
                DeliveryAddressScreen(address: order.shippingAddress),
                SizedBox(height: 20),
                // Order Items Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Order Items",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "${order.orderItems.length} items",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                // List of Order Items
                ListView.builder(
                  itemCount: order.orderItems.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return OrderItemScreen(
                      image: imageList[index] ?? "assets/images/waie2.png",
                      title: productTitles[index],
                      details: contentDetails[index],
                      price: prices[index],
                    );
                  },
                ),
                SizedBox(height: 20),
                // Order Summary
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
                OrderSummaryScreen(
                  items: [
                    {"label": "Subtotal", "price": "SAR ${order.totalPrice.toStringAsFixed(2)}"},
                    {"label": "Delivery", "price": "SAR ${SharedPrefKeys.deliveryFee.toStringAsFixed(2)}"},
                  ],
                  total: "SAR ${totalPayment.toStringAsFixed(2)}",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
