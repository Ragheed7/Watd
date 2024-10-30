// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:waie/core/helpers/spacing.dart';
import 'package:waie/features/products_list/data/model/product_response.dart';
import 'package:waie/features/products_list/presentation/widgets/product_item_price.dart';

class ProductItemDetails extends StatelessWidget {
  int itemIndex;
  final Product product;

  ProductItemDetails({
    Key? key,
    required this.itemIndex, required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              product.nameEn ?? "Product Name",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            // Description
            Text(
              "${product.descriptionEn ?? "Product Description"}",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            verticalSpace(8),
            // Price
           ProductItemPrice(product: product,)
          ],
        ),
      ),
    );
  }
}
