// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProductItemRatingAndPrice extends StatelessWidget {
  List<String> prices;
  List<String> reviews;
  int index;
  
  ProductItemRatingAndPrice({
    Key? key,
    required this.prices,
    required this.reviews,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          color: Colors.amber,
          size: 22,
        ),
        SizedBox(width: 4),
        Text(
          '(${reviews[index]})',
        ),
        Spacer(),
        Text(
          prices[index],
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFFDB3022),
          ),
        ),
      ],
    );
  }
}
