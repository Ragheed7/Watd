// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      isSuccess: json['isSuccess'] as bool?,
      message: json['message'] as String?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'message': instance.message,
      'result': instance.result,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      productId: (json['productId'] as num?)?.toInt(),
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      nameAr: json['nameAr'] as String?,
      nameEn: json['nameEn'] as String?,
      descriptionAr: json['descriptionAr'] as String?,
      descriptionEn: json['descriptionEn'] as String?,
      material: json['material'] == null
          ? null
          : Material.fromJson(json['material'] as Map<String, dynamic>),
      style: json['style'] == null
          ? null
          : Style.fromJson(json['style'] as Map<String, dynamic>),
      color: (json['color'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      width: (json['width'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      brand: json['brand'] == null
          ? null
          : Brand.fromJson(json['brand'] as Map<String, dynamic>),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      productStatus: (json['productStatus'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'productId': instance.productId,
      'category': instance.category,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
      'descriptionAr': instance.descriptionAr,
      'descriptionEn': instance.descriptionEn,
      'material': instance.material,
      'style': instance.style,
      'color': instance.color,
      'height': instance.height,
      'width': instance.width,
      'weight': instance.weight,
      'price': instance.price,
      'brand': instance.brand,
      'images': instance.images,
      'productStatus': instance.productStatus,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      categoryId: (json['categoryId'] as num?)?.toInt(),
      nameAr: json['nameAr'] as String?,
      nameEn: json['nameEn'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'categoryId': instance.categoryId,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
    };

Material _$MaterialFromJson(Map<String, dynamic> json) => Material(
      materialId: (json['materialId'] as num?)?.toInt(),
      materialNameAr: json['materialNameAr'] as String?,
      materialNameEn: json['materialNameEn'] as String?,
    );

Map<String, dynamic> _$MaterialToJson(Material instance) => <String, dynamic>{
      'materialId': instance.materialId,
      'materialNameAr': instance.materialNameAr,
      'materialNameEn': instance.materialNameEn,
    };

Style _$StyleFromJson(Map<String, dynamic> json) => Style(
      styleId: (json['styleId'] as num?)?.toInt(),
      styleNameAr: json['styleNameAr'] as String?,
      styleNameEn: json['styleNameEn'] as String?,
    );

Map<String, dynamic> _$StyleToJson(Style instance) => <String, dynamic>{
      'styleId': instance.styleId,
      'styleNameAr': instance.styleNameAr,
      'styleNameEn': instance.styleNameEn,
    };

Brand _$BrandFromJson(Map<String, dynamic> json) => Brand(
      brandId: (json['brandId'] as num?)?.toInt(),
      brandName: json['brandName'] as String?,
    );

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
      'brandId': instance.brandId,
      'brandName': instance.brandName,
    };
