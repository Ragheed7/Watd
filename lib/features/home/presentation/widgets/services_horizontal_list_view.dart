import 'package:flutter/material.dart';

class ServicesHorizontalListView extends StatelessWidget {
  final List Services;
  final List ServicesImgs;

  const ServicesHorizontalListView({super.key, required this.Services, required this.ServicesImgs});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 155,
      child: ListView.builder(
        itemCount: Services.length,
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 120,
            margin: EdgeInsets.only(
                right: index == 0 ? 0 : 10), // Add spacing between items
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
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => ProduCategory(),
                          //   ),
                          // );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            ServicesImgs[index],
                            width: 180,
                            fit: BoxFit.cover,
                            height: 200,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8), // Add spacing between image and text
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    Services[index],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
