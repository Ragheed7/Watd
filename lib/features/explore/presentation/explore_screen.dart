import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/di/dependency_injection.dart';
import 'package:waie/core/shared_models/category_data_model/category_data.dart';
import 'package:waie/features/products_list/logic/cubit/product_cubit.dart';
import 'package:waie/features/products_list/presentation/widgets/products_bloc_builder.dart';

class ExploreScreen extends StatelessWidget {
  final CategoryData? categoryData; // Make categoryData nullable

  const ExploreScreen({Key? key, this.categoryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductCubit>()
        ..getProducts(
          isInitialLoad: true,
          categoryId: categoryData?.categoryId, // Use null if categoryData is null
        ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Explore"),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ProductsBlocBuilder(
              categoryData: categoryData,
            ),
          ),
        ),
      ),
    );
  }
}
