import 'package:flutter/material.dart';
import 'package:waie/features/account/presentation/order_details_screen.dart';
import 'package:waie/features/account/presentation/widgets/order_images_list_screen.dart';

class OrderInfoScreen extends StatelessWidget {
  final List<String> imageList;

  OrderInfoScreen({required this.imageList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18),
      width: MediaQuery.of(context).size.width,
      height: 300,
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
              Text("Order number: 456123567", style: TextStyle(fontSize: 16)),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderDetailsScreen(),
                    ),
                  );
                },
                child: Text(
                  "Details",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(118, 192, 67, 1),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Text("Expiry 21/08/2024", style: TextStyle(fontSize: 16)),
          SizedBox(height: 6),
          Text("Estimated delivery date: 28/08/2024", style: TextStyle(fontSize: 16)),
          SizedBox(height: 6),
          Text("Order status: on the way", style: TextStyle(fontSize: 16)),
          SizedBox(height: 18),
          OrderImagesListScreen(imageList: imageList),
        ],
      ),
    );
  }
}
