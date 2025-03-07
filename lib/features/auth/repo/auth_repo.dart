import 'package:dio/dio.dart';
import 'package:watd/core/helpers/constants.dart';
import 'package:watd/core/helpers/shared_prefs_helper.dart';
import 'package:watd/core/networking/api_service.dart';
import 'package:watd/core/networking/dio_factory.dart';
import 'package:watd/features/auth/model/refresh_token_request_body.dart';

class AuthRepository {
  final ApiService _apiService;

  AuthRepository(this._apiService);

  /// Refreshes the access token using the refresh token.
  // Future<bool> refreshToken() async {
  //   try {
  //     final accessToken =
  //         await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  //     final refreshToken =
  //         await SharedPrefHelper.getSecuredString(SharedPrefKeys.refreshToken);

  //     if (accessToken == null ||
  //         accessToken.isEmpty ||
  //         refreshToken == null ||
  //         refreshToken.isEmpty) {
  //       return false;
  //     }

  //     final response = await _apiService.refreshToken(
  //       RefreshTokenRequestBody(
  //         accessToken: accessToken,
  //         refreshToken: refreshToken,
  //       ),
  //     );

  //     if (response.isSuccess == true && response.result != null) {
  //       final newAccessToken = response.result!.accessToken ?? '';
  //       final newRefreshToken = response.result!.refreshToken ?? '';

  //       await saveTokens(newAccessToken, newRefreshToken);

  //       return true;
  //     } else {
  //       // Refresh token invalid or expired
  //       await logout();
  //       return false;
  //     }
  //   } catch (e) {
  //     // Handle exceptions (e.g., network errors)
  //     await logout();
  //     return false;
  //   }
  // }

  Future<bool> refreshToken() async {
    try {
      final accessToken =
          await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
      final refreshToken =
          await SharedPrefHelper.getSecuredString(SharedPrefKeys.refreshToken);
      final refreshTokenExpiryString = await SharedPrefHelper.getSecuredString(
          SharedPrefKeys.refreshTokenExpiry);
      final DateTime refreshTokenExpiry = refreshTokenExpiryString != null
          ? DateTime.parse(refreshTokenExpiryString)
          : DateTime.now()
              .subtract(const Duration(days: 1)); // Assume expired if not found

      Duration timeUntilExpiration =
          refreshTokenExpiry.difference(DateTime.now());

      // Printing how much time is left until the token expires
      if (timeUntilExpiration.isNegative) {
        print("Token has already expired.");
      } else {
        print(
            "Token expires in: ${timeUntilExpiration.inDays} Days, ${timeUntilExpiration.inHours} Hours and ${timeUntilExpiration.inMinutes % 60} minutes.");
      }

      // Check if the refresh token has expired
      if (DateTime.now().isAfter(refreshTokenExpiry)) {
        await logout();
        return false; // Refresh token has expired; user needs to log in again
      }

      final response = await _apiService.refreshToken(
        RefreshTokenRequestBody(
          accessToken: accessToken!,
          refreshToken: refreshToken!,
        ),
      );

      if (response.isSuccess == true && response.result != null) {
        final newAccessTokenExpiry =
            DateTime.now().add(const Duration(minutes: 30));
        final newRefreshTokenExpiry = DateTime.now().add(const Duration(days: 7));

        await SharedPrefHelper.setSecuredString(
            SharedPrefKeys.userToken, response.result!.accessToken!);
        await SharedPrefHelper.setSecuredString(
            SharedPrefKeys.refreshToken, response.result!.refreshToken!);
        await SharedPrefHelper.setSecuredString(
            SharedPrefKeys.accessTokenExpiry,
            newAccessTokenExpiry.toIso8601String());
        await SharedPrefHelper.setSecuredString(SharedPrefKeys.refreshTokenExpiry, newRefreshTokenExpiry.toIso8601String());

        return true;
      } else {
        await logout();
        return false;
      }
    } catch (e) {
      await logout();
      return false;
    }
  }

  /// Saves both access and refresh tokens.
  Future<void> saveTokens(String accessToken, String refreshToken) async {
    await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.userToken, accessToken);
    await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.refreshToken, refreshToken);
  }
  
  /// Retries the failed request with updated headers.
  Future<Response> retryRequest(RequestOptions options) async {
    final dio = await DioFactory.getDio();
    return dio.fetch(options);
  }
    
  /// Logs out the user by clearing tokens and user data.
 Future<void> logout() async {
    await SharedPrefHelper.deleteSecuredString(SharedPrefKeys.userToken);
    await SharedPrefHelper.deleteSecuredString(SharedPrefKeys.refreshToken);
    await SharedPrefHelper.deleteSecuredString(
        SharedPrefKeys.accessTokenExpiry);
    await SharedPrefHelper.deleteSecuredString(
        SharedPrefKeys.refreshTokenExpiry);
  }
}
