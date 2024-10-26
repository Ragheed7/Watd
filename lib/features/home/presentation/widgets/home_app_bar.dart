import 'package:flutter/material.dart';
import 'package:waie/core/theming/colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          height: 50,
          width: 60,
          child: Image.asset("assets/images/waie2.png"),
        ),
        // for the search
        Container(
          padding: EdgeInsets.all(5),
          height: 50,
          width: MediaQuery.of(context).size.width / 1.75,
          decoration: BoxDecoration(
            color: Colors.black12.withOpacity(0.05),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: ColorsManager.mainGreen,
              ),
              border: InputBorder.none,
              label: Text(
                "Find your Product",
                style: TextStyle(),
              ),
            ),
          ),
        ),

        Container(
          height: 50,
          width: MediaQuery.of(context).size.width / 9,
          decoration: BoxDecoration(
            color: Colors.black12.withOpacity(0.05),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Icon(
              Icons.notifications_none,
              color: ColorsManager.mainGreen,
            ),
          ),
        ),
      ],
    );
  }
}
