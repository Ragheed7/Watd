import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/networking/api_constants.dart';
import 'package:waie/features/cart/data/model/remove_from_cart_item_request.dart';
import 'package:waie/features/cart/logic/cart_cubit.dart';
import 'package:waie/features/products_list/data/model/product_models/product.dart';
import 'package:waie/core/theming/colors.dart';

class CartItemScreen extends StatelessWidget {
  final Product product;

  const CartItemScreen({Key? key, required this.product}) : super(key: key);

  /// Helper method to construct the full image URL
  String getFullImageUrl(String? imageUrl) {
    if (imageUrl == null || imageUrl.isEmpty) {
      return 'assets/images/default_product.png';
    }
    if (imageUrl.startsWith('http') || imageUrl.startsWith('https')) {
      return imageUrl; 
    }
    
    return ApiConsts.serverBaseUrl + imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    // Extract necessary product details
    final fullImageUrl = product.images != null && product.images!.isNotEmpty
        ? getFullImageUrl(product.images!.first.imageUrl)
        : 'assets/images/Bedrooms.jpg';

    final name = product.nameEn ?? 'Unnamed Product';
    final price = product.price ?? 0.0;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          // Product Image
          fullImageUrl.startsWith('assets/')
              ? Image.asset(
                  fullImageUrl,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                )
              : Image.network(
                  fullImageUrl,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/images/Bedrooms.jpg',
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    );
                  },
                ),
          SizedBox(width: 16),
          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "SAR ${price.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorsManager.mainGreen,
                  ),
                ),
              ],
            ),
          ),
          // Remove Button
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              // Dispatch removeItemFromCart event
              final request =
                  RemoveFromCartItemRequest(productId: product.productId!);
              context.read<CartCubit>().removeItemFromCart(request);
            },
          ),
        ],
      ),
    );
  }
}
