import 'package:flutter/material.dart';
import 'package:waie/pages/ProduCategory.dart';

class TopCategoriesGridView extends StatelessWidget {
  final categoryImage;
  final categoryTitle;
  const TopCategoriesGridView({super.key,  required this.categoryImage, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categoryTitle.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        return Container(
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 120,
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProduCategory(),
                            ));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          categoryImage[index],
                          width: 180,
                          fit: BoxFit.cover,
                          height: 200,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 0),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  categoryTitle[index],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
