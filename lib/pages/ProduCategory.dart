import 'package:flutter/material.dart';
import 'package:waie/pages/ProductScreen.dart';

class ProduCategory extends StatelessWidget {
  List imageList = [
    "images/Offices.png",
    "images/bedrooms.jpg",
    "images/kitchens.jpg",
    "images/living room.png",
  ];

  List productTitle = [
    "Offices",
    "Bedrooms",
    "Kitchens",
    "Living Rooms",
  ];

  List prices = [
    "\$300",
    "\$650",
    "\$540",
    "\$700",
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
      appBar: AppBar(
        title: Text("Products"),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0), // Add horizontal padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Other widgets on your page

              // List of images and text
              ListView.builder(
                itemCount: imageList.length,
                physics:
                    NeverScrollableScrollPhysics(), // Disable ListView scrolling
                shrinkWrap:
                    true, // Wrap content, do not take all available height
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity, // Use full width for each row
                    margin:
                        EdgeInsets.only(bottom: 15), // Add space between items
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 180,
                          width: 180,
                          child: Stack(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductScreen(),
                                    ),
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    imageList[index],
                                    width: 180,
                                    fit: BoxFit.cover,
                                    height: 180, // Adjust height here
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productTitle[index],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 120,
                                child: Text(
                                  "Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                                  maxLines: 6,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 22,
                                  ),
                                  Text(
                                    '(' + reviews[index] + ')  ',
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    prices[index],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFDB3022),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              // Other widgets if any
            ],
          ),
        ),
      ),
    );
  }
}
