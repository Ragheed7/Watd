import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/theming/colors.dart';
import 'package:waie/features/products_list/data/model/product_response.dart';
import 'package:waie/features/products_list/logic/cubit/product_cubit.dart';
import 'package:waie/features/products_list/logic/cubit/product_state.dart';
import 'package:waie/features/products_list/presentation/widgets/products_list_view.dart';

class ProductsBlocBuilder extends StatelessWidget {
  const ProductsBlocBuilder({Key? key}) : super(key: key);

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
            return setupLoading();
          },
          productSuccess: (products) {
            var list = products;
            return setupSuccess(list);
          },
          productError: (errorHandler) {
            return setupError();
          },
          orElse: () {
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
    final products = list
        ?.where((product) => product != null)
        .cast<Product>()
        .toList() ?? [];

    return ProductsListView(
      products: products,
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
