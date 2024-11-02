import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/shared_models/category_data_model/category_data.dart';
import 'package:waie/core/theming/colors.dart';
import 'package:waie/features/products_list/data/model/product_response.dart';
import 'package:waie/features/products_list/logic/cubit/product_cubit.dart';
import 'package:waie/features/products_list/logic/cubit/product_state.dart';
import 'package:waie/features/products_list/presentation/widgets/products_list_view.dart';

class ProductsBlocBuilder extends StatelessWidget {
  final CategoryData categoryData;

  const ProductsBlocBuilder({Key? key, required this.categoryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return state.when(
          initial: () {
            // Trigger initial load
            context.read<ProductCubit>().getProducts(isInitialLoad: true);
            return setupLoading([]);
          },
          productLoading: (products) {
            print('State is ProductLoading with ${products?.length} products');
            return setupLoading(products);
          },
          productSuccess: (products) {
            print('State is ProductSuccess with ${products?.length} products');
            return setupSuccess(products);
          },
          productError: (errorHandler) {
            print('State is ProductError');
            return setupError();
          },
        );
      },
    );
  }

  Widget setupLoading(List<Product?>? list) {
    final products = list?.whereType<Product>().toList() ?? [];
    print('Products in setupLoading: ${products.length}');

    return Stack(
      children: [
        ProductsListView(
          products: products,
          categoryData: categoryData,
        ),
        Positioned(
          bottom: 16,
          left: 0,
          right: 0,
          child: Center(
            child: CircularProgressIndicator(color: ColorsManager.mainGreen),
          ),
        ),
      ],
    );
  }

  Widget setupSuccess(List<Product?>? list) {
    final products = list?.whereType<Product>().toList() ?? [];
    print('Products in setupSuccess: ${products.length}');

     if (products.isEmpty) {
    return Center(
      child: Text("No products available for this category."),
    );
  }

    return ProductsListView(
      products: products,
      categoryData: categoryData,
    );
  }

  Widget setupError() {
    return Center(
      child: Text("An error occurred"),
    );
  }
}
