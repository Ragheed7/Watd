import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/shared_models/user_addresses/data/model/get_addresses.dart';
import 'package:waie/core/shared_models/user_addresses/logic/address_cubit.dart';
import 'package:waie/features/account/presentation/edit_address_screen.dart';

class AddressCardScreen extends StatelessWidget {
  final Address address;

  const AddressCardScreen({
    Key? key,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18),
      width: MediaQuery.of(context).size.width,
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
          // Address Details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                address.country,
                style: TextStyle(fontSize: 16),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditAddressScreen(address: address),
                    ),
                  );
                },
                child: Text(
                  "Edit",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(118, 192, 67, 1),
                  ),
                ),
              ),
            ],
          ),
          Text(address.state, style: TextStyle(fontSize: 16)),
          Text(address.city, style: TextStyle(fontSize: 16)),
          Text(address.streetAddress, style: TextStyle(fontSize: 16)),
          Text(address.zipCode, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
