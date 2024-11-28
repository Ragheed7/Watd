import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/shared_models/category_data_model/category_data.dart';
import 'package:waie/core/theming/colors.dart';
import 'package:waie/features/products_list/data/model/product_models/product.dart';
import 'package:waie/features/products_list/data/model/product_response.dart';
import 'package:waie/features/products_list/logic/cubit/product_cubit.dart';
import 'package:waie/features/products_list/presentation/widgets/product_item.dart';
import 'package:waie/features/product_screen/presentation/ProductScreen.dart';

class ProductsGridView extends StatefulWidget {
  final List<Product> products;
  final CategoryData? categoryData;

  ProductsGridView({
    Key? key,
    required this.products,
    required this.categoryData,
  }) : super(key: key);

  @override
  State<ProductsGridView> createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsGridView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Add scroll listener
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    // Dispose the controller
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Check if we are at the bottom of the list
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      // Request more products
      context.read<ProductCubit>().getProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    final productCubit = context.read<ProductCubit>();
    return GridView.builder(
      controller: _scrollController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, 
        crossAxisSpacing: 10.0, 
        mainAxisSpacing: 10.0, 
        childAspectRatio: 0.6, 
      ),
      itemCount: widget.products.length + 1, // +1 for the loading indicator
      itemBuilder: (context, index) {
        if (index < widget.products.length) {
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
              product: product,
              categoryData: widget.categoryData,
              isGrid: true,
            ),
          );
        } else {
          // Show loading indicator at the end
          return _buildLoadingIndicator(productCubit);
        }
      },
    );
  }

  Widget _buildLoadingIndicator(ProductCubit productCubit) {
    if (productCubit.hasMoreData && productCubit.isLoadingMore) {
      return Center(
        child: CircularProgressIndicator(
          color: ColorsManager.mainGreen,
        ),
      );
    } else if (!productCubit.hasMoreData) {
      // No more data to load
      return Center(
        child: Text('No more products'),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
