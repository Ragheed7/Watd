import 'package:watd/core/networking/api_error_handler.dart';
import 'package:watd/core/networking/api_result.dart';
import 'package:watd/core/networking/api_service.dart';
import 'package:watd/features/home/data/model/category_response.dart';

class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<ApiResult<CategoryResponse>> getCategories() async {
    try {
      final response = await _apiService.getCategories();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
