// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:waie/features/products_list/data/model/product_response.dart';
import 'package:waie/features/products_list/presentation/widgets/product_image.dart';
import 'package:waie/features/products_list/presentation/widgets/product_item_details.dart';

class ProductItem extends StatelessWidget {
  final int itemIndex;
  final int selectedIndex;
  final Product product;

  ProductItem({
    Key? key,
    required this.itemIndex,
    required this.selectedIndex,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left side (image)
          ProductImage(index: itemIndex,),
          // Right side
          ProductItemDetails(itemIndex: itemIndex, product: product)
        ],
      ),
    );
  }
}
