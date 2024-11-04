import 'package:flutter/material.dart';
class OrderItemScreen extends StatelessWidget {
  final String image;
  final String title;
  final List<String> details;
  final String price;

  OrderItemScreen({
    required this.image,
    required this.title,
    required this.details,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ...details.map((detail) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        detail,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    )),
                SizedBox(height: 10),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(118, 192, 67, 1),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
