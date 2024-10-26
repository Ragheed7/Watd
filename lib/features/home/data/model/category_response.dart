import 'package:json_annotation/json_annotation.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse {
  @JsonKey(name: 'result')
  final List<CategoryData?>? categories;
  final bool? isSuccess;
  final String? message;

  CategoryResponse({
    required this.categories,
    required this.isSuccess,
    this.message,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}

@JsonSerializable()
class CategoryData {
  @JsonKey(name: 'value')
  final int? id;
  final String? nameAr;
  final String? nameEn;

  CategoryData({
    required this.id,
    required this.nameAr,
    required this.nameEn,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDataToJson(this);
}
