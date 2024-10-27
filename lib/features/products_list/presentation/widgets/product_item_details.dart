// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:waie/core/helpers/spacing.dart';
import 'package:waie/features/products_list/presentation/widgets/product_item_rating_and_price.dart';

class ProductItemDetails extends StatelessWidget {
  List<String> productTitle;
  List<String> prices;
  List<String> reviews;
  int index;

  ProductItemDetails({
    Key? key,
    required this.productTitle,
    required this.prices,
    required this.reviews,
    required this.index,
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
              productTitle[index],
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            // Description
            Text(
              "Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            verticalSpace(8),
            // Rating and Price
           ProductItemRatingAndPrice(prices: prices, reviews: reviews, index: index)
          ],
        ),
      ),
    );
  }
}
