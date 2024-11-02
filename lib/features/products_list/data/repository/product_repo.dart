import 'package:waie/core/networking/api_error_handler.dart';
import 'package:waie/core/networking/api_result.dart';
import 'package:waie/core/networking/api_service.dart';
import 'package:waie/features/products_list/data/model/product_response.dart';

class ProductRepo {
  final ApiService _apiService;

  ProductRepo(this._apiService);

  Future<ApiResult<ProductResponse>> getProduct({
    required int pageNumber,
    required int pageSize,
  }) async {
    try {
      final response = await _apiService.getProduct(
        pageNumber: pageNumber,
        pageSize: pageSize,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
