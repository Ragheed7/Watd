import 'package:flutter/material.dart';
import 'package:waie/core/shared_models/user_data/user_data.dart';
import 'package:waie/features/account/presentation/edit_address_screen.dart';

class AddreessCardScreen extends StatelessWidget {
  final String country;
  final String state;
  final String city;
  final String street;
  final String postalCode;
  final UserData? userInfo;


  const AddreessCardScreen({
    Key? key,
    required this.country,
    required this.state,
    required this.city,
    required this.street,
    required this.postalCode, 
    this.userInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18),
      width: MediaQuery.of(context).size.width,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                country,
                style: TextStyle(fontSize: 16),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditAddressScreen(userInfo: userInfo,),
                    ),
                  );
                },
                child: Text(
                  "Edit",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(118, 192, 67, 1),
                  ),
                ),
              ),
            ],
          ),
          Text(state, style: TextStyle(fontSize: 16)),
          Text(city, style: TextStyle(fontSize: 16)),
          Text(street, style: TextStyle(fontSize: 16)),
          Text(postalCode, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
