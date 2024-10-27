import 'package:flutter/material.dart';
import 'package:waie/features/products_list/presentation/widgets/products_list_view.dart';
import 'package:waie/pages/ProductScreen.dart';

class ProductsListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ProductsListView()
          ),
        ),
      ),
    );
  }
}
