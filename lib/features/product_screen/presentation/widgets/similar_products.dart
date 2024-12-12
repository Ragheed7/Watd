import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/theming/colors.dart';
import 'package:waie/features/product_screen/logic/similar_products_cubit.dart';
import 'package:waie/features/product_screen/presentation/ProductScreen.dart';
import 'package:waie/features/products_list/data/model/product_models/product.dart';
import 'package:waie/features/products_list/logic/cubit/product_cubit.dart';
import 'package:waie/features/product_screen/presentation/widgets/images_slider.dart';
import 'package:waie/features/products_list/logic/cubit/product_state.dart'; 

class SimilarProducts extends StatefulWidget {
  final int? categoryId;
  final int? materialId;
  final int? brandId;
  final int? styleId;

  const SimilarProducts({
    super.key,
    this.categoryId,
    this.materialId,
    this.brandId,
    this.styleId,
  });

  @override
  State<SimilarProducts> createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
   @override
  void initState() {
    super.initState();
    context.read<SimilarProductsCubit>().fetchProducts(
      categoryId: widget.categoryId,
      materialId: widget.materialId,
      brandId: widget.brandId,
      styleId: widget.styleId,
      pageSize: 8,  
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarProductsCubit, ProductState>(
  builder: (context, state) {
    if (state is ProductLoading) {
      return CircularProgressIndicator(color: ColorsManager.mainGreen,);
    } else if (state is ProductSuccess) {
      return buildSimilarProductsList(state.products);
    } else if (state is ProductError) {
      return Text('Failed to load similar products');
    }
    return SizedBox();  
  },
    );
  }

  Widget buildSimilarProductsList(List<Product> products) { 
    return SizedBox(
      height: 250, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductScreen(product: product)),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 16),
              child: buildProductCard(product),
            ),
          );
        },
      ),
    );
  }

  Widget buildProductCard(Product product) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: ColorsManager.navBarGrey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Use ImagesSlider for product images
          Expanded(
            child: ImagesSlider(product: product),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.nameEn ?? "Unknown", maxLines: 1, overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.mainBlack,
                    fontFamily: 'Cabin',
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "SAR ${product.price}",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.mainGreen,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
