import 'package:flutter/material.dart';
// import 'package:waie/constants/spare_appbar.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}




class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: const SpareAppBar(),
        body: Center(
          child: Text("Account Page", style: TextStyle(fontSize: 30)),
        ));
  }
}
