// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:waie/features/products_list/data/model/product_response.dart';

class ProductItemPrice extends StatelessWidget {
  final Product product;

  ProductItemPrice({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "\$${product.price ?? "0"}",
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
