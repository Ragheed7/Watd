import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:waie/core/networking/api_constants.dart';
import 'package:waie/features/login/data/model/login_request_body.dart';
import 'package:waie/features/login/data/model/login_response.dart';

part 'api_service.g.dart';

//annotation for retrofit
@RestApi(baseUrl: ApiConsts.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConsts.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody
  );
}