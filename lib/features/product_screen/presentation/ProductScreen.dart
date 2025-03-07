import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:watd/core/helpers/spacing.dart';
import 'package:watd/features/product_screen/logic/similar_products_cubit.dart';
import 'package:watd/features/product_screen/presentation/widgets/add_to_cart_button.dart';
import 'package:watd/features/product_screen/presentation/widgets/images_slider.dart';
import 'package:watd/features/product_screen/presentation/widgets/product__info.dart';
import 'package:watd/features/product_screen/presentation/widgets/product_description.dart';
import 'package:watd/features/product_screen/presentation/widgets/similar_products.dart';
import 'package:watd/features/product_screen/presentation/widgets/title_category_and_price.dart';
import 'package:watd/features/products_list/data/model/product_models/product.dart';

class ProductScreen extends StatefulWidget {
  final Product product;

  ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    // Remove the fetchSimilarProducts() call here
    // The SimilarProducts widget will handle fetching.
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
                // Just provide the cubit and parameters, don't fetch here
                BlocProvider.value(
                  value: GetIt.instance<SimilarProductsCubit>(),
                  child: SimilarProducts(
                    currentProductId: widget.product.productId,
                    categoryId: widget.product.category?.categoryId,
                    brandId: widget.product.brand!.brandId,
                    styleId: widget.product.style!.styleId,
                    materialId: widget.product.material!.materialId,
                  ),
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

  // Remove closing the cubit here if SimilarProducts still needs it.
  // If you must close it, ensure it's not used elsewhere after closing.
  // @override
  // void dispose() {
  //   similarProductsCubit.close();
  //   super.dispose();
  // }
}
