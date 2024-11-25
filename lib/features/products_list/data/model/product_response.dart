import 'package:json_annotation/json_annotation.dart';
import 'package:waie/core/shared_models/category_data_model/category_data.dart';

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
    Map<String, dynamic> toJson() => _$ProductResponseToJson(this);

}

@JsonSerializable()
class Product {
  int? productId;
  CategoryData? category;
  String? nameAr;
  String? nameEn;
  String? descriptionAr;
  String? descriptionEn;
  Material? material;
  Style? style;
  int? color;
  double? height;
  double? width;
  double? weight;
  double? price;
  Brand? brand;
  List<ImageData>? images;
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
  Map<String, dynamic> toJson() => _$ProductToJson(this);
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
    Map<String, dynamic> toJson() => _$MaterialToJson(this);
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
  Map<String, dynamic> toJson() => _$StyleToJson(this);
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
  Map<String, dynamic> toJson() => _$BrandToJson(this);
}

@JsonSerializable()
class ImageData {
  String? imageUrl;

  ImageData({this.imageUrl});

  factory ImageData.fromJson(Map<String, dynamic> json) =>
      _$ImageDataFromJson(json);

  Map<String, dynamic> toJson() => _$ImageDataToJson(this);
}