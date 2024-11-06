import 'package:flutter/material.dart';
import 'package:waie/features/account/presentation/widgets/app_bar_screen.dart';
import 'package:waie/features/account/presentation/widgets/order_info_screen.dart';

class MyOrderScreen extends StatelessWidget {
  final List<String> imageList = [
    "assets/images/img1.jpg",
    "assets/images/img2.jpg",
    "assets/images/img3.jpg",
    "assets/images/img4.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarScreen(title: 'My order',),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(),
                SizedBox(height: 10),
                Text(
                  "My order",
                  style: TextStyle(fontSize: 19,fontWeight: FontWeight.w600,),),
                SizedBox(height: 15),
                OrderInfoScreen(imageList: imageList),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
