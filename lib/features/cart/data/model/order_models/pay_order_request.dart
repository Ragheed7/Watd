import 'package:json_annotation/json_annotation.dart';

part 'pay_order_request.g.dart';

@JsonSerializable()
class PayOrderRequest {
  final String creditCardNumber;
  final String cardholderName;
  final String expirationDate; // Format: YYYY-MM-DD
  final String cvv;
  final bool cash;

  PayOrderRequest({
    required this.creditCardNumber,
    required this.cardholderName,
    required this.expirationDate,
    required this.cvv,
    required this.cash,
  });

  factory PayOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$PayOrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PayOrderRequestToJson(this);
}
