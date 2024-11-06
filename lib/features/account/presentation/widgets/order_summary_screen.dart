import 'package:flutter/material.dart';

class OrderSummaryScreen extends StatelessWidget {
  final List<Map<String, String>> items = [
    {"label": "item 1", "price": "SAR 500"},
    {"label": "item 2", "price": "SAR 100"},
    {"label": "item 3", "price": "SAR 20"},
    {"label": "item 4", "price": "SAR 10"},
    {"label": "Delivery", "price": "SAR 35"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...items.map((item) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item["label"]!, style: TextStyle(fontSize: 15)),
                Text(item["price"]!, style: TextStyle(fontSize: 15)),
              ],
            )),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total Payment", style: TextStyle(fontSize: 15)),
            Text(
              "SAR 655",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(118, 192, 67, 1),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
