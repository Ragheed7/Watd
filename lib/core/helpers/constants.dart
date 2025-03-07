bool isLoggedInUser = false;

class SharedPrefKeys {
  static const String userToken = "userToken";
  static const String refreshToken = 'refreshToken';
  static const String accessTokenExpiry = 'accessTokenExpiry';
  static const String refreshTokenExpiry = 'refreshTokenExpiry';
  static const String userData = 'userData';
  static const double deliveryFee = 35;
}

class ImageLoader {
  static const String logo = "assets/images/logo.png";
  static const String logoWthoutName = "assets/images/logoWithoutName.png";
  static const String saudiFlag = "assets/images/Rounded.png";
  static const String enviroment = "assets/images/env01.png";
  static const String homeBanner = "assets/images/banner.png";
}

class RequestType {
  static const int Repair = 0;
  static const int Return = 1;
  static const int Sell = 2;
  static const int Donate = 3;
}
