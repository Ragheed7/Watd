import 'package:flutter/material.dart';
// import 'package:waie/constants/spare_appbar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: const SpareAppBar(),
        body: Center(
          child: Text("Search Page", style: TextStyle(fontSize: 30)),
        ));
  }
}
