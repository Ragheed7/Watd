// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:waie/features/home/data/model/category_response.dart';
import 'package:waie/features/home/presentation/widgets/category_item.dart';
import 'package:waie/pages/ProduCategory.dart';

class CategoriesGridView extends StatefulWidget {
  final List<CategoryData?> categories;
  const CategoriesGridView({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  State<CategoriesGridView> createState() => _CategoriesGridViewState();
}

class _CategoriesGridViewState extends State<CategoriesGridView> {
  var selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.categories.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        final category = widget.categories[index];
        if (category == null) {
          return const SizedBox.shrink();
        };
        return GestureDetector(
            onTap: () {
              // selectedCategoryIndex = index;
              // setState(() {});
            },
            child: CategoryItem(
                itemIndex: index,
                selectedIndex: selectedCategoryIndex,
                categoryData: category));
      },
    );
  }
}
