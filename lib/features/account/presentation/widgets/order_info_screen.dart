import 'package:flutter/material.dart';
import 'package:waie/core/networking/api_constants.dart';
import 'package:waie/features/account/presentation/order_details_screen.dart';
import 'package:waie/features/account/presentation/widgets/order_images_list_screen.dart';
import 'package:waie/features/cart/data/model/order_models/sub_order_models/order.dart';

class OrderInfoScreen extends StatelessWidget {
  final Order order;

  OrderInfoScreen({required this.order});

  @override
  Widget build(BuildContext context) {
    // Extract image URLs from order items
    List<String?> imageList = order.orderItems
        .map((item) => item.product.images != null && item.product.images!.isNotEmpty
            ? (ApiConsts.serverBaseUrl + item.product.images![0].imageUrl!) 
            : "assets/images/waie2.png")
        .toList();

     return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
      width: MediaQuery.of(context).size.width,
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
          // Order ID and Details Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Order ID: ${order.orderId}", style: TextStyle(fontSize: 16)),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderDetailsScreen(order: order),
                    ),
                  );
                },
                child: Text(
                  "Details",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(118, 192, 67, 1),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            "Created at: ${_formatDate(order.createdAt)}",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 6),
          Text(
            "Estimated delivery: ${order.shippingDate != null ? _formatDate(order.shippingDate!) : "N/A"}",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 6),
          Text(
            "Status: ${_getStatusText(order.status)}",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 12),
          // Display images related to the order
          OrderImagesListScreen(imageList: imageList),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    // Format the date as needed, e.g., DD/MM/YYYY
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
  }

  String _getStatusText(int status) {
    // Map status codes to readable text
    switch (status) {
      case 0:
        return "Pending";
      case 1:
        return "Processing";
      case 2:
        return "On the way";
      case 3:
        return "Delivered";
      default:
        return "Unknown";
    }
  }
}
