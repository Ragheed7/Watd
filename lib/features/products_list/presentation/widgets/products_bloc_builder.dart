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
  const ProductsBlocBuilder({Key? key, required this.categoryData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      buildWhen: (previous, current) =>
          current is ProductLoading ||
          current is ProductSuccess ||
          current is ProductError,
      builder: (context, state) {
        return state.maybeWhen(
          productLoading: () {
            print('State is ProductLoading');

            return setupLoading();
          },
          productSuccess: (products) {
            print('State is ProductSuccess with ${products?.length} products');

            var list = products;
            return setupSuccess(list);
          },
          productError: (errorHandler) {
            print('State is ProductError');

            return setupError();
          },
          orElse: () {
            print('State is orElse');

            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget setupLoading() {
    return const SizedBox(
      height: 100,
      child: Center(
        child: CircularProgressIndicator(color: ColorsManager.mainGreen),
      ),
    );
  }

  Widget setupSuccess(List<Product?>? list) {
    final products =
        list?.where((product) => product != null).cast<Product>().toList() ??
            [];
    print('Products in setupSuccess: ${products.length}');

    return ProductsListView(
      products: products,
      categoryData: categoryData,
    );
  }

  Widget setupError() {
    return const SizedBox.shrink(
      child: Text("error"),
    );
  }
}
