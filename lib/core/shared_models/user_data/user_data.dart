import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  int? userType;
  String? userId;
  String? email;
  @JsonKey(name: "mobileNumber")
  String? phone;
  String? userName;
  bool? isActive;
  
  UserData({this.userType, this.phone, this.userName, this.isActive});
  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
    Map<String, dynamic> toJson() => _$UserDataToJson(this);
}