import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  String? message;
  bool? isSuccess;
  Result? result;

  LoginResponse({this.result, this.message, this.isSuccess});
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable()
class Result {
  Token? tokens;
  UserData? user;

  Result({this.tokens, this.user});
  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@JsonSerializable()
class UserData {
  int? userType;
  String? phone;
  String? userName;

  UserData({this.userType, this.phone, this.userName});
  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
}

@JsonSerializable()
class Token {
  String? accessToken;
  String? refreshToken;

  Token({this.accessToken, this.refreshToken});
  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}