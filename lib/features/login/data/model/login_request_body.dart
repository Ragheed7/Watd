import 'package:json_annotation/json_annotation.dart';
part 'login_request_body.g.dart';

@JsonSerializable()

class LoginRequestBody {
  final String phone;

  LoginRequestBody({
    required this.phone
  });
    Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}