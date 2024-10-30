import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:waie/core/theming/colors.dart';
import 'package:waie/features/products_list/data/model/product_response.dart';

class ProductScreen extends StatefulWidget {
  final Product product;

  ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final CarouselSliderController _carouselController = CarouselSliderController();
  int _current = 0;

  List<String> imgs = [
    "assets/images/Offices.png",
    "assets/images/Bedrooms.jpg",
    "assets/images/Kitchens.jpg",
    "assets/images/LivingRooms.jpg",
  ];
  bool isAssets = true; 

  // @override
  // void initState() {
  //   super.initState();
  //   // Initialize the images list with product images or default images
  //   imgs = widget.product.images ?? [
  //     "assets/images/default_image.jpg",
  //   ];

    // Determine if images are assets or network images
    // if (imgs.isNotEmpty && !imgs.first.startsWith('assets/')) {
    //   isAssets = false;
    // }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.nameEn ?? "Product Overview"),
        leading: BackButton(),
        backgroundColor: Color(0xFFFFFFFF),
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16,0,16,32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 380,
                  width: MediaQuery.of(context).size.width,
                  // Slider of images
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CarouselSlider(
                        items: imgs.map((imageUrl) {
                          return Builder(
                            builder: (BuildContext context) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: isAssets
                                    ? Image.asset(
                                        imageUrl,
                                        fit: BoxFit.cover,
                                        width: MediaQuery.of(context).size.width,
                                      )
                                    : Image.network(
                                        imageUrl,
                                        fit: BoxFit.cover,
                                        width: MediaQuery.of(context).size.width,
                                      ),
                              );
                            },
                          );
                        }).toList(),
                        carouselController: _carouselController,
                        options: CarouselOptions(
                          height: 350,
                          initialPage: 0,
                          autoPlay: false,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: false,
                          viewportFraction: 1.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          },
                        ),
                      ),
                      // Dots Indicator
                      Positioned(
                        bottom: 10,
                        child: AnimatedSmoothIndicator(
                          activeIndex: _current,
                          count: imgs.length,
                          effect: ExpandingDotsEffect(
                            activeDotColor: ColorsManager.mainGreen,
                            dotHeight: 8,
                            dotWidth: 8,
                            expansionFactor: 3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Product Details
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Product Name and Category
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.nameEn ?? "Product's Name",
                          style: TextStyle(
                            color: ColorsManager.mainBlack,
                            fontWeight: FontWeight.w500,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          widget.product.category?.nameEn ?? "Product's Category",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    // Product Price
                    Text(
                      "\$${widget.product.price ?? "0"}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: ColorsManager.mainGreen,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // Product Description
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.product.descriptionEn ?? "Product's Description",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                // add to cart button
                Container(
                  height: 54,
                  width: 259,
                  child: MaterialButton(
                    onPressed: () {
                      
                    },
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
