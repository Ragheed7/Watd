import 'package:json_annotation/json_annotation.dart';

part 'payment_card.g.dart';

@JsonSerializable()
class PaymentCard {
  String cardNumber;
  String cardHolderName;
  int expiryMonth;
  int expiryYear;

  PaymentCard({
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryMonth,
    required this.expiryYear,
  });

  factory PaymentCard.fromJson(Map<String, dynamic> json) =>
      _$PaymentCardFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentCardToJson(this);
}