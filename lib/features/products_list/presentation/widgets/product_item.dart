// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:waie/features/products_list/presentation/widgets/product_image.dart';
import 'package:waie/features/products_list/presentation/widgets/product_item_details.dart';

class ProductItem extends StatelessWidget {
  List<String> imageList;
  List<String> productTitle;
  List<String> prices;
  List<String> reviews;
  int index;


  ProductItem({
    Key? key,
    required this.imageList,
    required this.productTitle,
    required this.prices,
    required this.reviews,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left side (image)
                    ProductImage(imageList: imageList, index: index),
                    // Right side
                    ProductItemDetails(productTitle: productTitle, prices: prices, reviews: reviews, index: index)
                  ],
                ),
              );
  }
}
