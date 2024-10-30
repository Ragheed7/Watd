import 'package:flutter/material.dart';
import 'package:waie/features/products_list/data/model/product_response.dart';
import 'package:waie/features/products_list/presentation/widgets/product_item.dart';
import 'package:waie/pages/ProductScreen.dart';

class ProductsListView extends StatefulWidget {
  final List<Product> products;

  ProductsListView({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  State<ProductsListView> createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsListView> {
  var selectedProductIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          itemCount: widget.products.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final product = widget.products[index];
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductScreen(),
                    ),
                  );
                },
                child: ProductItem(
                  itemIndex: index,
                  selectedIndex: selectedProductIndex,
                  product: product,
                ));
          },
        ),
      ],
    );
  }
}
