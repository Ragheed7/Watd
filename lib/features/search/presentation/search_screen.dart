import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/di/dependency_injection.dart';
import 'package:waie/core/shared_models/category_data_model/category_data.dart';
import 'package:waie/features/products_list/logic/cubit/product_cubit.dart';
import 'package:waie/features/products_list/presentation/widgets/products_bloc_builder.dart';
import 'package:waie/features/search/presentation/widgets/search_app_bar.dart';

class SearchScreen extends StatelessWidget {
  final CategoryData? categoryData; // categoryData nullable

  const SearchScreen({Key? key, this.categoryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductCubit>()
        ..getProducts(
          isInitialLoad: true,
          categoryId:
              categoryData?.categoryId, // null if categoryData is null
        ),
      child: Scaffold(
        body: SafeArea(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    pinned: false,
                    floating: true,
                    snap: true,
                    backgroundColor: Colors.white,
                    expandedHeight: 70.0,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 20),
                        child: SearchAppBar(),
                      ),
                    ),
                  ),
                ];
              },
              body: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 20),
                child: ProductsBlocBuilder(
                  categoryData: categoryData,
                  grid: true,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
