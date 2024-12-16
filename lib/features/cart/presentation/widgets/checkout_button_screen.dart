import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/di/dependency_injection.dart';
import 'package:waie/core/theming/colors.dart';
import 'package:waie/features/cart/presentation/check_out_screen.dart';
import 'package:waie/features/products_list/logic/cubit/product_cubit.dart';

class CheckoutButtonScreen extends StatelessWidget {
  const CheckoutButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider<ProductCubit>(
                create: (_) => getIt<ProductCubit>(),
                child: CheckOutScreen(),
              ),
            ),
          );
        },
        color: ColorsManager.mainGreen,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1,
          vertical: 16,
        ),
        child: Text(
          'Checkout',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'cabin',
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        minWidth: MediaQuery.of(context).size.width * 0.8,
      ),
    );
  }
}
