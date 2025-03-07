import 'package:flutter/material.dart';
import 'package:watd/core/helpers/spacing.dart';
import 'package:watd/core/theming/colors.dart';
import 'package:watd/features/products_list/data/model/product_models/product.dart';

class ProductInfo extends StatefulWidget {
  final Product product;

  const ProductInfo({super.key, required this.product});

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ProductInfoWidget(widget.product.brand?.brandName ?? "Brand"),
            horizontalSpace(10),
            ProductInfoWidget(
                widget.product.material?.materialNameEn ?? "Material"),
            horizontalSpace(10),
            ProductInfoWidget(widget.product.style?.styleNameEn ?? "Style"),
          ],
        ),
        verticalSpace(10),
        Row(
          children: [
            ProductMeasurmentsWidget(widget.product.height.toString(), 'Hight', "cm"),
            horizontalSpace(10),
            ProductMeasurmentsWidget(
                widget.product.width.toString(), "Width", "cm"),
            horizontalSpace(10),
            ProductMeasurmentsWidget(widget.product.weight.toString(), "Weight", "kg"),
          ],
        ),
      ],
    );
  }

  Widget ProductInfoWidget(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.5, vertical: 4),
      constraints: const BoxConstraints(maxWidth: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: ColorsManager.mainGreen, width: 1),
      ),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 12,
          fontFamily: 'cabin',
          fontWeight: FontWeight.w400,
          color: ColorsManager.mainGrey,
        ),
      ),
    );
  }

    Widget ProductMeasurmentsWidget(String text, String title, String ms) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.5, vertical: 4),
      constraints: const BoxConstraints(maxWidth: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: ColorsManager.navBarGrey, width: 1),
      ),
      child: Text(
        "$title: " + text + " $ms",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 11,
          fontFamily: 'cabin',
          fontWeight: FontWeight.w400,
          color: ColorsManager.mainGrey,
        ),
      ),
    );
  }
}
