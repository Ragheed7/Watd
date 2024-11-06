import 'package:flutter/material.dart';

class DeliveryAddressSectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18),
      width: MediaQuery.of(context).size.width,
      height: 160,
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
          Text("\nSaudi Arabia", style: TextStyle(fontSize: 16)),
          Text("Qassim", style: TextStyle(fontSize: 16)),
          Text("Buraidah", style: TextStyle(fontSize: 16)),
          Text("3, Saleh Street", style: TextStyle(fontSize: 16)),
          Text("97545", style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
