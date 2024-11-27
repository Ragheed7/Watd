// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayOrderRequest _$PayOrderRequestFromJson(Map<String, dynamic> json) =>
    PayOrderRequest(
      creditCardNumber: json['creditCardNumber'] as String,
      cardholderName: json['cardholderName'] as String,
      expirationDate: json['expirationDate'] as String,
      cvv: json['cvv'] as String,
      cash: json['cash'] as bool,
    );

Map<String, dynamic> _$PayOrderRequestToJson(PayOrderRequest instance) =>
    <String, dynamic>{
      'creditCardNumber': instance.creditCardNumber,
      'cardholderName': instance.cardholderName,
      'expirationDate': instance.expirationDate,
      'cvv': instance.cvv,
      'cash': instance.cash,
    };
