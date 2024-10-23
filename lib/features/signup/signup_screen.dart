import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waie/core/helpers/constants.dart';
import 'package:waie/core/routing/routes.dart';
import 'package:waie/core/theming/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignInState();
}

class _SignInState extends State<SignUpScreen> {
  GlobalKey<FormState> formState = GlobalKey();
  String phoneNumber = '';
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Distributes space evenly
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 80), // Space from top
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Image.asset(ImageLoader.logo),
                    width: 200.w,
                    height: 100.h,
                  ),
                  SizedBox(height: 48),
                  Container(
                    padding: EdgeInsets.only(left: 30),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontFamily: 'cabin',
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Form(
                      key: formState,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Phone number',
                            style: TextStyle(
                              fontFamily: 'cabin',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            cursorColor: ColorsManager.mainGreen,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(12),
                                child: Image.asset(
                                  ImageLoader.saudiFlag,
                                  height: 22,
                                ),
                              ),
                              filled: true,
                              fillColor: Color.fromRGBO(245, 245, 245, 1),
                              hintText: 'Phone number',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(width: 1),
                              ),
                              contentPadding: EdgeInsets.all(10),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              RegExp regex = RegExp(r'^0?5[0-9]{8}$');
                              if (!regex.hasMatch(value)) {
                                return 'Please enter a valid Saudi phone number';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              phoneNumber = value!;
                            },
                          ),
                          SizedBox(height: 64),
                          Container(
                            alignment: Alignment.center,
                            child: MaterialButton(
                              onPressed: () {
                                if (formState.currentState!.validate()) {
                                  formState.currentState!
                                      .save(); // Save the phone number
                                  Navigator.of(context).pushNamed(
                                    Routes.otpScreen,
                                    arguments: {
                                      'phoneNumber': phoneNumber,
                                    },
                                  );
                                  phoneController.clear();
                                }
                              },
                              color: ColorsManager.mainGreen,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 80, vertical: 10),
                              child: Text(
                                'Sign-Up',
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
                            ),
                          ),
                          SizedBox(height: 8),
                          // Removed the TextButtons from here
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Moved the TextButtons here
          Container(
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    // Implement 'Contact us' functionality
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Having issue? ',
                        style: TextStyle(
                          fontFamily: 'cabin',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ColorsManager.secondaryGrey,
                        ),
                      ),
                      Text(
                        'Contact us',
                        style: TextStyle(
                          fontFamily: 'cabin',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: ColorsManager.mainGreen,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.loginScreen);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account? ',
                        style: TextStyle(
                          fontFamily: 'cabin',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ColorsManager.secondaryGrey,
                        ),
                      ),
                      Text(
                        'Register here',
                        style: TextStyle(
                          fontFamily: 'cabin',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: ColorsManager.mainGreen,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16), // Optional spacing at the bottom
              ],
            ),
          ),
        ],
      ),
    );
  }
}
