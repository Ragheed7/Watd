import 'package:flutter/material.dart';
import 'package:watd/core/theming/colors.dart';
import 'package:watd/features/account/presentation/add_new_payment_screen.dart';

class AddNewPaymentButtonScreen extends StatelessWidget {
  final String userId; 
  const AddNewPaymentButtonScreen({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNewPaymentScreen(userId: userId),
            ),
          );
        },
        color: ColorsManager.mainGreen,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1,
          vertical: 16,
        ),
        child: Text(
          '+ Add new payment',
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
