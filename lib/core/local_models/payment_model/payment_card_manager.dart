import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waie/core/local_models/payment_model/payment_card.dart';

class PaymentCardManager {
  static final PaymentCardManager _instance = PaymentCardManager._internal();
  factory PaymentCardManager() => _instance;

  PaymentCardManager._internal();

  List<PaymentCard> _paymentCards = [];

  List<PaymentCard> get paymentCards => _paymentCards;

  static const String _storageKey = 'payment_cards';

  // Made public by removing the underscore
  Future<void> loadPaymentCards() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(_storageKey);
    if (jsonString != null) {
      List<dynamic> jsonList = jsonDecode(jsonString);
      _paymentCards = jsonList.map((json) => PaymentCard.fromJson(json)).toList();
    } else {
      _paymentCards = [];
    }
  }

  Future<void> _savePaymentCards() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> jsonList =
        _paymentCards.map((card) => card.toJson()).toList();
    String jsonString = jsonEncode(jsonList);
    await prefs.setString(_storageKey, jsonString);
  }

  Future<void> addPaymentCard(PaymentCard card) async {
    _paymentCards.add(card);
    await _savePaymentCards();
  }

  Future<void> updatePaymentCard(int index, PaymentCard card) async {
    _paymentCards[index] = card;
    await _savePaymentCards();
  }

  Future<void> deletePaymentCard(int index) async {
    _paymentCards.removeAt(index);
    await _savePaymentCards();
  }
}
