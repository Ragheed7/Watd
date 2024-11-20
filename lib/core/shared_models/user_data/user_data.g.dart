// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      userType: (json['userType'] as num?)?.toInt(),
      phone: json['mobileNumber'] as String?,
      userName: json['userName'] as String?,
      isActive: json['isActive'] as bool?,
    )
      ..userId = json['userId'] as String?
      ..email = json['email'] as String?;

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'userType': instance.userType,
      'userId': instance.userId,
      'email': instance.email,
      'mobileNumber': instance.phone,
      'userName': instance.userName,
      'isActive': instance.isActive,
    };
