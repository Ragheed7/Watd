import 'package:json_annotation/json_annotation.dart';

part 'category_data.g.dart';

@JsonSerializable()
class CategoryData {
  final int? categoryId;
  final String? nameAr;
  final String? nameEn;
  final String? imageUrl;

  CategoryData({
    required this.categoryId,
    required this.nameAr,
    required this.nameEn,
    required this.imageUrl,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      categoryId: json['value'] as int? ?? json['categoryId'] as int?,
      nameAr: json['nameAr'] as String?,
      nameEn: json['nameEn'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() => _$CategoryDataToJson(this);
}
