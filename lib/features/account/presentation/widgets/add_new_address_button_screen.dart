import 'package:flutter/material.dart';
import 'package:waie/features/account/presentation/add_new_address_screen.dart';
import 'package:waie/features/login/data/model/login_response.dart';

class AddNewAddressButtonScreen extends StatelessWidget {
    final UserData? userInfo;

  const AddNewAddressButtonScreen({Key? key, this.userInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNewAddressScreen(userInfo: userInfo,),
            ),
          );
        },
        color: Color.fromRGBO(118, 192, 67, 1),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1,
          vertical: 16,
        ),
        child: Text(
          '+ Add new address',
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
