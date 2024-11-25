import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? args}) {
    return Navigator.of(this).pushNamed(routeName, arguments: args);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? args}) {
    return Navigator.of(this).pushReplacementNamed(routeName, arguments: args);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? args, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: args);
  }

  void pop() => Navigator.of(this).pop();
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

// Extension to validate CVV
extension CvvValidation on String {
  bool isValidCvv() {
    final regex = RegExp(r'^\d{3,4}$');
    return regex.hasMatch(this);
  }
}
