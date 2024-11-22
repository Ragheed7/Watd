import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:waie/core/networking/api_constants.dart';
import 'package:waie/core/shared_models/default_api_response.dart';
import 'package:waie/core/shared_models/user_addresses/data/model/create_address.dart';
import 'package:waie/core/shared_models/user_addresses/data/model/create_address_response.dart';
import 'package:waie/core/shared_models/user_addresses/data/model/get_addresses.dart';
import 'package:waie/core/shared_models/user_addresses/data/model/update_address.dart';
import 'package:waie/features/account/presentation/widgets/user_info/data/model/update_user_request.dart';
import 'package:waie/features/account/presentation/widgets/user_info/data/model/update_user_response.dart';
import 'package:waie/features/auth/model/refresh_token_request_body.dart';
import 'package:waie/features/auth/model/refresh_token_response.dart';
import 'package:waie/features/home/data/model/category_response.dart';
import 'package:waie/features/login/data/model/login_request_body.dart';
import 'package:waie/features/login/data/model/login_response.dart';
import 'package:waie/features/products_list/data/model/product_response.dart';

part 'api_service.g.dart';

//annotation for retrofit
@RestApi(baseUrl: ApiConsts.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // registering
  @POST(ApiConsts.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConsts.refreshToken)
  Future<RefreshTokenResponse> refreshToken(
      @Body() RefreshTokenRequestBody body);

  // home
  @GET(ApiConsts.categories)
  Future<CategoryResponse> getCategories();

  // products list with pagination
  @GET(ApiConsts.Product)
  Future<ProductResponse> getProduct({
    @Query('PageNumber') required int pageNumber,
    @Query('PageSize') required int pageSize,
    @Query('CategoryId') int? categoryId,
  });

  @POST(ApiConsts.updateUser)
  Future<UpdateUserResponse> updateUser(
      @Body() UpdateUserRequest updateUserRequest);

  // Get addresses
  @GET(ApiConsts.getAddresses)
  Future<GetAddresses> getAddresses();

  // Create address 
  @POST(ApiConsts.createAddress)
  Future<CreateAddressResponse> createAddress(@Body() CreateAddress createAddress);

  // Update address
  @PUT(ApiConsts.updateAddress)
  Future<DefaultApiResponse> updateAddress(@Body() UpdateAddress updateAddress);
}
