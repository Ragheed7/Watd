// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
    List<String> imageList;
int index;
  ProductImage({
    Key? key,
    required this.imageList,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                      height: 120,
                      width: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          imageList[index],
                          width: 120,
                          fit: BoxFit.cover,
                          height: 120,
                        ),
                      ),
                    );
  }
}
