import 'package:flutter/material.dart';
import 'package:waie/core/theming/colors.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                  height: 54,
                  width: 259,
                  child: MaterialButton(
                    onPressed: () {},
                    color: ColorsManager.mainGreen,
                    padding: EdgeInsets.symmetric(horizontal: 54, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add to Cart",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'cabin',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 22,
                        )
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                );
  }
}