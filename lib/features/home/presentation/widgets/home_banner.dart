import 'package:flutter/material.dart';
import 'package:watd/core/helpers/constants.dart';
import 'package:watd/core/theming/colors.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: ColorsManager.greyBox,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.asset(ImageLoader.homeBanner),
    );
  }
}
