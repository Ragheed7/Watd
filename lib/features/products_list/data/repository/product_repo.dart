import 'package:waie/core/networking/api_error_handler.dart';
import 'package:waie/core/networking/api_result.dart';
import 'package:waie/core/networking/api_service.dart';
import 'package:waie/features/products_list/data/model/product_response.dart';

class ProductRepo {
  final ApiService _apiService;

  ProductRepo(this._apiService);

  Future<ApiResult<ProductResponse>> getProduct() async {
    try {
      final response = await _apiService.getProduct();
      return ApiResult.success(response);
    } catch (error, stackTrace) {
      print('Error in getProduct: $error');
      print('StackTrace: $stackTrace');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}