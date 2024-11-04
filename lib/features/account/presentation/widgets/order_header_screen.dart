import 'package:flutter/material.dart';

class OrderHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Order details",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 15),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18),
          width: MediaQuery.of(context).size.width,
          height: 130,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 2),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("\nOrder number: 456123567", style: TextStyle(fontSize: 16)),
              Text("Order date: 21/08/2024", style: TextStyle(fontSize: 16)),
              Text("Estimated delivery date: 28/08/2024",
                  style: TextStyle(fontSize: 16)),
              Text("Order status: on the way", style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ],
    );
  }
}
