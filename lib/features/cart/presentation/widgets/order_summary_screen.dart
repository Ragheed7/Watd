import 'package:flutter/material.dart';

class OrderSummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        orderRow("item 1", "SAR 500"),
        orderRow("item 2", "SAR 100"),
        orderRow("item 3", "SAR 20"),
        orderRow("item 4", "SAR 10"),
        orderRow("Delivery", "SAR 35"),
        Divider(),
        orderRow("Total Payment", "SAR 655", isTotal: true),
      ],
    );
  }

  Row orderRow(String item, String price, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          item,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        Text(
          price,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500,
            color: isTotal ? Color.fromRGBO(118, 192, 67, 1) : Colors.black,
          ),
        ),
      ],
    );
  }
}
