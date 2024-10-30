import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waie/core/networking/api_error_handler.dart';
import 'package:waie/core/shared_models/category_data_model/category_data.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  // Categories 
  const factory HomeState.categoriesLoading() = CategoriesLoading;
  const factory HomeState.categoriesSuccess(List<CategoryData?>? categories) = CategoriesSuccess;
  const factory HomeState.categoriesError(ErrorHandler errorHandler) = CategoriesError;
}
