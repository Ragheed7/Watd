import 'package:json_annotation/json_annotation.dart';
import 'package:waie/features/products_list/data/model/product_models/product.dart';

part 'pay_order_response.g.dart';

@JsonSerializable(explicitToJson: true)
class PayOrderResponse {
  final Result result;
  final bool isSuccess;
  final String message;

  PayOrderResponse({
    required this.result,
    required this.isSuccess,
    required this.message,
  });

  factory PayOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$PayOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PayOrderResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Result {
  final int orderId;
  final DateTime createdAt;
  final int status;
  final int shippingAddressId;
  final ShippingAddress shippingAddress;
  final Transaction transaction;
  final int shippingStatus;
  final DateTime shippingDate;
  final double totalPrice;
  final List<OrderItem> orderItems;

  Result({
    required this.orderId,
    required this.createdAt,
    required this.status,
    required this.shippingAddressId,
    required this.shippingAddress,
    required this.transaction,
    required this.shippingStatus,
    required this.shippingDate,
    required this.totalPrice,
    required this.orderItems,
  });

  factory Result.fromJson(Map<String, dynamic> json) =>
      _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class ShippingAddress {
  final int addressId;
  final String streetAddress;
  final String city;
  final String state;
  final String zipCode;
  final String country;

  ShippingAddress({
    required this.addressId,
    required this.streetAddress,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingAddressToJson(this);
}

@JsonSerializable()
class Transaction {
  final DateTime transactionDate;
  final double totalPrice;
  final int transactionStatus;
  final int provider;
  final String cardholderName;

  Transaction({
    required this.transactionDate,
    required this.totalPrice,
    required this.transactionStatus,
    required this.provider,
    required this.cardholderName,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}

@JsonSerializable()
class OrderItem {
  final Product product;

  OrderItem({
    required this.product,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}
