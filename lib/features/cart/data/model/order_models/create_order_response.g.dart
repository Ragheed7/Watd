// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrderResponse _$CreateOrderResponseFromJson(Map<String, dynamic> json) =>
    CreateOrderResponse(
      result: Order.fromJson(json['result'] as Map<String, dynamic>),
      isSuccess: json['isSuccess'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$CreateOrderResponseToJson(
        CreateOrderResponse instance) =>
    <String, dynamic>{
      'result': instance.result.toJson(),
      'isSuccess': instance.isSuccess,
      'message': instance.message,
    };

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
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

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'orderId': instance.orderId,
      'createdAt': instance.createdAt.toIso8601String(),
      'status': instance.status,
      'shippingAddressId': instance.shippingAddressId,
      'shippingAddress': instance.shippingAddress,
      'transaction': instance.transaction,
      'shippingStatus': instance.shippingStatus,
      'shippingDate': instance.shippingDate.toIso8601String(),
      'totalPrice': instance.totalPrice,
      'orderItems': instance.orderItems,
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
