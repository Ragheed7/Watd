import 'package:flutter/material.dart';
import 'package:waie/core/helpers/spacing.dart';
import 'package:waie/features/home/presentation/widgets/home_app_bar.dart';
import 'package:waie/features/home/presentation/widgets/home_banner.dart';
import 'package:waie/features/home/presentation/widgets/left_section_title.dart';
import 'package:waie/features/home/presentation/widgets/services_horizontal_list_view.dart';
import 'package:waie/features/home/presentation/widgets/top_categories_grid_view.dart';

class HomeScreen extends StatelessWidget {
  List categoryImage = [
    "assets/images/Offices.jpg",
    "assets/images/Bedrooms.jpg",
    "assets/images/Kitchens.jpg",
    "assets/images/LivingRooms.jpg",
  ];

  List ServicesImgs = [
    "assets/images/Sell.jpg",
    "assets/images/Repair.jpg",
    "assets/images/Donate.jpg",
  ];

  List categoryTitle = [
    "Offices",
    "Bedrooms",
    "Kitchens",
    "Living Rooms",
  ];

  List Services = [
    "Sell",
    "Repair",
    "Donate",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HomeAppBar(),
                verticalSpace(20),
                HomeBanner(),
                verticalSpace(24),
                LeftSectionTitle(text: "Request a Service"),
                verticalSpace(20),
                ServicesHorizontalListView(Services: Services, ServicesImgs: ServicesImgs,),
                verticalSpace(24),
                LeftSectionTitle(text: "Top Categories"),
                verticalSpace(20),
                TopCategoriesGridView(categoryTitle: categoryTitle, categoryImage: categoryImage,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
