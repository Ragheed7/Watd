import 'package:flutter/material.dart';
import 'package:waie/core/routing/routes.dart';
import 'package:waie/core/shared_models/user_addresses/data/model/create_address.dart';
import 'package:waie/core/shared_models/user_addresses/logic/address_cubit.dart';
import 'package:waie/core/shared_models/user_addresses/logic/address_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/theming/colors.dart';
import 'package:waie/features/account/presentation/saved_address_screen.dart';
import 'package:waie/features/account/presentation/widgets/app_bar_screen.dart';
import 'package:waie/features/account/presentation/widgets/user_info/presentation/widgets/user_info_text_form_field.dart';

class AddNewAddressScreen extends StatefulWidget {
  const AddNewAddressScreen({Key? key}) : super(key: key);

  @override
  _AddNewAddressScreenState createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController countryController =
      TextEditingController(text: 'Saudi Arabia');
  final TextEditingController streetAddressController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();

  String? selectedState;
  String? selectedCity;

  final Map<String, List<String>> cities = {
    'Riyadh': ['Riyadh', 'Diriyah', 'Kharj'],
    'Qassim': ['Buraydah', 'Onaizah'],
    'Makkah': ['Makkah', 'Jeddah'],
  };

  final List<String> states = ['Riyadh', 'Qassim', 'Makkah'];

  @override
  void dispose() {
    streetAddressController.dispose();
    zipCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addressCubit = context.read<AddressCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarScreen(title: "New Address"),
      body: BlocListener<AddressCubit, AddressState>(
        listener: (context, state) {
          if (state is AddressCreated) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Address added successfully')),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const SavedAddressScreen(),
              ),
            );
          } else if (state is Error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Divider(),
                    SizedBox(height: 40),
                    UserInfoTextFormField(
                      controller: countryController,
                      labelText: "Country",
                      enabled: false,
                    ),
                    SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      dropdownColor: Colors.white,
                      decoration: InputDecoration(labelText: "Region"),
                      value: selectedState,
                      items: states.map((state) {
                        return DropdownMenuItem(
                          value: state,
                          child: Text(state),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedState = value;
                          selectedCity = null; 
                        });
                      },
                      validator: (value) =>
                          value == null ? 'Please select a region' : null,
                    ),
                    SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      dropdownColor: Colors.white,
                      decoration: InputDecoration(labelText: "City"),
                      value: selectedCity,
                      items: selectedState == null
                          ? []
                          : cities[selectedState]!.map((city) {
                              return DropdownMenuItem(
                                value: city,
                                child: Text(city),
                              );
                            }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCity = value;
                        });
                      },
                      validator: (value) =>
                          value == null ? 'Please select a city' : null,
                    ),
                    SizedBox(height: 20),
                    UserInfoTextFormField(
                      controller: streetAddressController,
                      labelText: "Street Address",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter street address';
                        }
                        final words = value.trim().split(RegExp(r'\s+'));
                        if (words.length < 2) {
                          return 'Street address must be at least 2 words';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    UserInfoTextFormField(
                      controller: zipCodeController,
                      labelText: "Zip code (Postal Code)",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter zip code';
                        }
                        if (!RegExp(r'^\d{5}$').hasMatch(value)) {
                          return 'Zip code must be exactly 5 digits';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 50),
                    Center(
                      child: MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final newAddress = CreateAddress(
                              streetAddress: streetAddressController.text,
                              city: selectedCity!,
                              state: selectedState!,
                              zipCode: zipCodeController.text,
                              country: countryController.text,
                            );
                            addressCubit.createAddress(newAddress);
                          }
                        },
                        color: ColorsManager.mainGreen,
                        padding: EdgeInsets.symmetric(
                            horizontal: 90, vertical: 16),
                        child: Text(
                          'Confirm details',
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
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

