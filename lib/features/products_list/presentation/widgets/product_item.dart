import 'package:flutter/material.dart';
import 'package:waie/core/shared_models/category_data_model/category_data.dart';
import 'package:waie/features/products_list/data/model/product_response.dart';
import 'package:waie/features/products_list/presentation/widgets/product_image.dart';
import 'package:waie/features/products_list/presentation/widgets/product_item_details.dart';

class ProductItem extends StatelessWidget {
  final int itemIndex;
  final int selectedIndex;
  final Product product;
  final CategoryData categoryData;

  ProductItem({
    Key? key,
    required this.itemIndex,
    required this.selectedIndex,
    required this.product,
    required this.categoryData,
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
          ProductImage(
            index: itemIndex,
            categoryData: categoryData,
            product: product,
          ),
          // Right side
          ProductItemDetails(itemIndex: itemIndex, product: product)
        ],
      ),
    );
  }
}
