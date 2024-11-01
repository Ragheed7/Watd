import 'package:flutter/material.dart';
import 'package:waie/core/shared_models/category_data_model/category_data.dart';
import 'package:waie/features/products_list/data/model/product_response.dart';
import 'package:waie/features/products_list/presentation/widgets/product_item.dart';
import 'package:waie/features/product_screen/presentation/ProductScreen.dart';

class ProductsListView extends StatefulWidget {
  final List<Product> products;
  final CategoryData categoryData;

  ProductsListView({
    Key? key,
    required this.products,
    required this.categoryData,
  }) : super(key: key);

  @override
  State<ProductsListView> createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsListView> {
  var selectedProductIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                  builder: (context) => ProductScreen(product: product),
                ),
              );
            },
            child: ProductItem(
              itemIndex: index,
              selectedIndex: selectedProductIndex,
              product: product,
              categoryData: widget.categoryData,
            ));
      },
    );
  }
}
