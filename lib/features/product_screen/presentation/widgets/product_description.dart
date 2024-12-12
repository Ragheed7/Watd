import 'package:flutter/material.dart';
import 'package:image/image.dart';
import 'package:waie/features/products_list/data/model/product_models/product.dart';
import 'package:waie/features/products_list/data/model/product_response.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(top: 6),
        child: Text(
          product.descriptionEn ?? "Product's Description",
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
