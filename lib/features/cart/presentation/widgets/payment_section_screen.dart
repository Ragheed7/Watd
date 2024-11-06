import 'package:flutter/material.dart';

class PaymentSectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18),
      width: MediaQuery.of(context).size.width,
      height: 190,
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
          Text("\n4123 1232 4231 2341", style: TextStyle(fontSize: 16)),
          Text("Karem Maged", style: TextStyle(fontSize: 16)),
          Text("Buraidah", style: TextStyle(fontSize: 16)),
          Text("Exp 12/25", style: TextStyle(fontSize: 16)),
          SizedBox(height: 4),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "CVV",
              prefixIcon: Icon(Icons.payment),
            ),
          ),
        ],
      ),
    );
  }
}