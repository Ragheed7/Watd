import 'package:flutter/material.dart';
// import 'package:waie/constants/spare_appbar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: const SpareAppBar(),
        body: Center(
          child: Text("Cart Page", style: TextStyle(fontSize: 30)),
        ));
  }
}
