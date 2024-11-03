import 'package:flutter/material.dart';
import 'package:waie/features/account/presentation/add_new_address_screen.dart';
import 'package:waie/features/account/presentation/edit_address_screen.dart';

class SavedAddressScreen extends StatelessWidget {
  const SavedAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Saved Address"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(),
                SizedBox(height: 10),
                Text(
                  "Saved Address",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 15),
                Container(
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
                            "Saudi Arabia",
                            style: TextStyle(fontSize: 16),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditAddressScreen(),
                                  ));
                            },
                            child: Text(
                              "Edit",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFFDB3022),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Qassim",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Buraidah",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "3, Saleh Street",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "97545",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 100),
                Center(
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddNewAddressScreen(),
                        ),
                      );
                    },
                    color: Color.fromRGBO(118, 192, 67, 1),
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width *0.1,
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
                    minWidth: MediaQuery.of(context).size.width *0.8,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
