import 'package:flutter/material.dart';
import 'package:waie/core/helpers/constants.dart';
import 'package:waie/features/home/data/model/category_response.dart';
import 'package:waie/pages/ProduCategory.dart';

class CategoryItem extends StatelessWidget {
  final int itemIndex;
  final int selectedIndex;
  final CategoryData categoryData;

  CategoryItem({
    Key? key,
    required this.itemIndex,
    required this.selectedIndex,
    required this.categoryData,
  }) : super(key: key);

  List CategoryImage = [
    "assets/images/Offices.jpg",
    "assets/images/Bedrooms.jpg",
    "assets/images/Kitchens.jpg",
    "assets/images/LivingRooms.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(
        right: itemIndex == 0 ? 0 : 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            width: 145,
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProduCategory(),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      // categoryData.image,
                      // "assets/images/LivingRooms.jpg",
                      CategoryImage[itemIndex],
                      width: 180,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              categoryData.nameEn ?? "Category Name",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
