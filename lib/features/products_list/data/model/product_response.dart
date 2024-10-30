import 'package:json_annotation/json_annotation.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  bool? isSuccess;
  String? message;
  List<Product?>? result;

  ProductResponse({
    this.isSuccess,
    this.message,
    this.result,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
}

@JsonSerializable()
class Product {
  int? productId;
  Category? category;
  String? nameAr;
  String? nameEn;
  String? descriptionAr;
  String? descriptionEn;
  Material? material;
  Style? style;
  int? color;
  int? height;
  int? width;
  int? weight;
  int? price;
  Brand? brand;
  List<String>? images;
  int? productStatus;

  Product({
    this.productId,
    this.category,
    this.nameAr,
    this.nameEn,
    this.descriptionAr,
    this.descriptionEn,
    this.material,
    this.style,
    this.color,
    this.height,
    this.width,
    this.weight,
    this.price,
    this.brand,
    this.images,
    this.productStatus,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@JsonSerializable()
class Category {
  int? categoryId;
  String? nameAr;
  String? nameEn;

  Category({
    this.categoryId,
    this.nameAr,
    this.nameEn,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@JsonSerializable()
class Material {
  int? materialId;
  String? materialNameAr;
  String? materialNameEn;

  Material({
    this.materialId,
    this.materialNameAr,
    this.materialNameEn,
  });

  factory Material.fromJson(Map<String, dynamic> json) =>
      _$MaterialFromJson(json);
}

@JsonSerializable()
class Style {
  int? styleId;
  String? styleNameAr;
  String? styleNameEn;

  Style({
    this.styleId,
    this.styleNameAr,
    this.styleNameEn,
  });

  factory Style.fromJson(Map<String, dynamic> json) => _$StyleFromJson(json);
}

@JsonSerializable()
class Brand {
  int? brandId;
  String? brandName;

  Brand({
    this.brandId,
    this.brandName,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
}
