import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/helpers/spacing.dart';
import 'package:waie/features/product_screen/logic/similar_products_cubit.dart';
import 'package:waie/features/product_screen/presentation/widgets/add_to_cart_button.dart';
import 'package:waie/features/product_screen/presentation/widgets/images_slider.dart';
import 'package:waie/features/product_screen/presentation/widgets/product__info.dart';
import 'package:waie/features/product_screen/presentation/widgets/product_description.dart';
import 'package:waie/features/product_screen/presentation/widgets/similar_products.dart';
import 'package:waie/features/product_screen/presentation/widgets/title_category_and_price.dart';
import 'package:waie/features/products_list/logic/cubit/product_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:waie/features/products_list/data/model/product_models/product.dart';

class ProductScreen extends StatefulWidget {
  final Product product;

  ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late SimilarProductsCubit similarProductsCubit;

  @override
  void initState() {
    super.initState();
    similarProductsCubit = GetIt.instance<SimilarProductsCubit>();
    fetchSimilarProducts();
  }

  void fetchSimilarProducts() {
    similarProductsCubit.fetchProducts(
      categoryId: widget.product.category?.categoryId,
      pageSize: 8, // You can define this value as needed
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.nameEn ?? "Product Overview"),
        leading: BackButton(),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImagesSlider(product: widget.product),
                verticalSpace(20),
                TitleCategoryAndPrice(product: widget.product),
                verticalSpace(10),
                ProductInfo(product: widget.product),
                verticalSpace(20),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Description",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                ),
                ProductDescription(product: widget.product),
                verticalSpace(25),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Similar Products",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                ),
                BlocProvider.value(
                  value: similarProductsCubit,
                  child: SimilarProducts(
                      categoryId: widget.product.category?.categoryId),
                ),
                verticalSpace(30),
                AddToCartButton(product: widget.product),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    similarProductsCubit.close();
    super.dispose();
  }
}
