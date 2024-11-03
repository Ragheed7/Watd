// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryData _$CategoryDataFromJson(Map<String, dynamic> json) => CategoryData(
      categoryId: (json['categoryId'] as num?)?.toInt(),
      nameAr: json['nameAr'] as String?,
      nameEn: json['nameEn'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$CategoryDataToJson(CategoryData instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
      'imageUrl': instance.imageUrl,
    };
