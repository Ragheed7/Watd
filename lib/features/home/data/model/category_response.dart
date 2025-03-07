import 'package:json_annotation/json_annotation.dart';
import 'package:watd/core/shared_models/category_data_model/category_data.dart';

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


