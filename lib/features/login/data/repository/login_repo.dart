import 'package:watd/core/networking/api_error_handler.dart';
import 'package:watd/core/networking/api_result.dart';
import 'package:watd/core/networking/api_service.dart';
import 'package:watd/features/login/data/model/login_request_body.dart';
import 'package:watd/features/login/data/model/login_response.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
