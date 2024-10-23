import 'package:flutter/material.dart';
import 'package:waie/core/theming/colors.dart';
import 'package:waie/pages/ProduCategory.dart';

class HomeScreen extends StatelessWidget {
  List imageList = [
    "assets/images/Offices.jpg",
    "assets/images/Bedrooms.jpg",
    "assets/images/Kitchens.jpg",
    "assets/images/LivingRooms.jpg",
  ];

  List ServicesImgs = [
    "assets/images/Sell.jpg",
    "assets/images/Repair.jpg",
    "assets/images/Donate.jpg",
  ];

  List productTitle = [
    "Offices",
    "Bedrooms",
    "Kitchens",
    "Living Rooms",
  ];

  List Services = [
    "Sell",
    "Repair",
    "Donate",
  ];

  List prices = [
    "\$300",
    "\$650",
    "\$50",
    "\$100",
  ];

  List reviews = [
    "54",
    "120",
    "42",
    "34",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
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
                ),
                SizedBox(height: 20),
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: ColorsManager.greyBox,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset("assets/images/banner.png"),
                ),
                SizedBox(height: 24),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Request a Service",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GridView.builder(
                  itemCount: Services.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.6,
                    crossAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 120,
                            child: Stack(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) => ProduCategory(),
                                    //     ));
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      ServicesImgs[index],
                                      width: 180,
                                      fit: BoxFit.cover,
                                      height: 200,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(height: 0),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              Services[index],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: 24),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Top Categories",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GridView.builder(
                  itemCount: productTitle.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 120,
                            child: Stack(
                              children: [
                                InkWell(
                                  onTap: () {
                                     Navigator.push(
                                         context,
                                         MaterialPageRoute(
                                           builder: (context) => ProduCategory(),
                                         ));
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      imageList[index],
                                      width: 180,
                                      fit: BoxFit.cover,
                                      height: 200,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(height: 0),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              productTitle[index],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
