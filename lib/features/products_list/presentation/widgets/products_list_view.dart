import 'package:flutter/material.dart';
import 'package:waie/features/products_list/presentation/widgets/product_item.dart';
import 'package:waie/pages/ProductScreen.dart';

class ProductsListView extends StatelessWidget {
  ProductsListView({super.key});

  final List<String> imageList = [
    "assets/images/Offices.png",
    "assets/images/Bedrooms.jpg",
    "assets/images/Kitchens.jpg",
    "assets/images/LivingRooms.jpg",
  ];

  final List<String> productTitle = [
    "Offices",
    "Bedrooms",
    "Kitchens",
    "Living Rooms",
  ];

  final List<String> prices = [
    "\$300",
    "\$650",
    "\$540",
    "\$700",
  ];

  final List<String> reviews = [
    "54",
    "120",
    "42",
    "34",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          itemCount: imageList.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductScreen(),
                  ),
                );
              },
              child: ProductItem(imageList: imageList, prices: prices, productTitle: productTitle, reviews: reviews, index: index,)
            );
          },
        ),
      ],
    );
  }
}
