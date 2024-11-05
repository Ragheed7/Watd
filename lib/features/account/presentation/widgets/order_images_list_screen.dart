import 'package:flutter/material.dart';

class OrderImagesListScreen extends StatelessWidget {
  final List<String> imageList;

  OrderImagesListScreen({required this.imageList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: ListView.builder(
        itemCount: imageList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 130,
            margin: EdgeInsets.only(right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imageList[index],
                fit: BoxFit.cover,
                height: 130,
                width: 130,
              ),
            ),
          );
        },
      ),
    );
  }
}
