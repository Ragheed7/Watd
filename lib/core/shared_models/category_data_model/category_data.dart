import 'package:json_annotation/json_annotation.dart';

part 'category_data.g.dart';

@JsonSerializable()
class CategoryData {
  final int? id;
  final String? nameAr;
  final String? nameEn;

  CategoryData({
    required this.id,
    required this.nameAr,
    required this.nameEn,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      id: json['value'] as int? ?? json['categoryId'] as int?,
      nameAr: json['nameAr'] as String?,
      nameEn: json['nameEn'] as String?,
    );
  }

  Map<String, dynamic> toJson() => _$CategoryDataToJson(this);
}
