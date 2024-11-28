// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayOrderResponse _$PayOrderResponseFromJson(Map<String, dynamic> json) =>
    PayOrderResponse(
      result: Result.fromJson(json['result'] as Map<String, dynamic>),
      isSuccess: json['isSuccess'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$PayOrderResponseToJson(PayOrderResponse instance) =>
    <String, dynamic>{
      'result': instance.result.toJson(),
      'isSuccess': instance.isSuccess,
      'message': instance.message,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      orderId: (json['orderId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      status: (json['status'] as num).toInt(),
      shippingAddressId: (json['shippingAddressId'] as num).toInt(),
      shippingAddress: ShippingAddress.fromJson(
          json['shippingAddress'] as Map<String, dynamic>),
      transaction:
          Transaction.fromJson(json['transaction'] as Map<String, dynamic>),
      shippingStatus: (json['shippingStatus'] as num).toInt(),
      shippingDate: DateTime.parse(json['shippingDate'] as String),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      orderItems: (json['orderItems'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'orderId': instance.orderId,
      'createdAt': instance.createdAt.toIso8601String(),
      'status': instance.status,
      'shippingAddressId': instance.shippingAddressId,
      'shippingAddress': instance.shippingAddress.toJson(),
      'transaction': instance.transaction.toJson(),
      'shippingStatus': instance.shippingStatus,
      'shippingDate': instance.shippingDate.toIso8601String(),
      'totalPrice': instance.totalPrice,
      'orderItems': instance.orderItems.map((e) => e.toJson()).toList(),
    };

ShippingAddress _$ShippingAddressFromJson(Map<String, dynamic> json) =>
    ShippingAddress(
      addressId: (json['addressId'] as num).toInt(),
      streetAddress: json['streetAddress'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      zipCode: json['zipCode'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$ShippingAddressToJson(ShippingAddress instance) =>
    <String, dynamic>{
      'addressId': instance.addressId,
      'streetAddress': instance.streetAddress,
      'city': instance.city,
      'state': instance.state,
      'zipCode': instance.zipCode,
      'country': instance.country,
    };

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      transactionDate: DateTime.parse(json['transactionDate'] as String),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      transactionStatus: (json['transactionStatus'] as num).toInt(),
      provider: (json['provider'] as num).toInt(),
      cardholderName: json['cardholderName'] as String,
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'transactionDate': instance.transactionDate.toIso8601String(),
      'totalPrice': instance.totalPrice,
      'transactionStatus': instance.transactionStatus,
      'provider': instance.provider,
      'cardholderName': instance.cardholderName,
    };

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'product': instance.product,
    };
