import 'dart:ffi';

bool isLoggedInUser = false;

class SharedPrefKeys {
  static const String userToken = "userToken";
  static const String refreshToken = 'refreshToken';
  static const String userData = 'userData'; 
  static const double deliveryFee = 35; 
}

class ImageLoader {
  static const String logo = "assets/images/waie2.png";
  static const String saudiFlag = "assets/images/Rounded.png";
  static const String enviroment = "assets/images/env01.png";
  static const String homeBanner = "assets/images/banner.png";
}
