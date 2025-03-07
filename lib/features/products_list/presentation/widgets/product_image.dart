import 'package:flutter/material.dart';
import 'package:watd/core/networking/api_constants.dart';
import 'package:watd/core/theming/colors.dart';
import 'package:watd/features/products_list/data/model/product_models/product.dart';
import 'package:watd/core/shared_models/category_data_model/category_data.dart';

class ProductImage extends StatelessWidget {
  final CategoryData? categoryData;
  final Product? product;

  const ProductImage({
    Key? key,
    required this.categoryData,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imageUrl;

    if (product?.images?.isNotEmpty == true && product!.images!.last.imageUrl != null) {
      imageUrl = ApiConsts.serverBaseUrl + product!.images!.first.imageUrl!;
    } else {
      imageUrl = "assets/images/logoWithoutName.png";
    }

    return SizedBox(
      height: 120,
      width: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: imageUrl.startsWith('http')
            ? Image.network(
                imageUrl,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
                // Show a loading indicator while the image is loading
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.mainGreen,
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                // Show a fallback image if there's an error loading the image
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "assets/images/logoWithoutName.png",
                    width: 120,
                    fit: BoxFit.fitWidth,
                    height: 120,
                  );
                },
              )
            : Image.asset(
                imageUrl,
                width: 120,
                fit: BoxFit.cover,
                height: 120,
              ),
      ),
    );
  }
}
