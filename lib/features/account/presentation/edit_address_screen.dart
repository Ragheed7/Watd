import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watd/core/shared_models/user_addresses/data/model/get_addresses.dart';
import 'package:watd/core/shared_models/user_addresses/data/model/update_address.dart';
import 'package:watd/core/shared_models/user_addresses/logic/address_cubit.dart';
import 'package:watd/core/shared_models/user_addresses/logic/address_state.dart';
import 'package:watd/core/theming/colors.dart';
import 'package:watd/features/account/presentation/saved_address_screen.dart';
import 'package:watd/features/account/presentation/widgets/app_bar_screen.dart';
import 'package:watd/features/account/presentation/widgets/user_info/presentation/widgets/user_info_text_form_field.dart';

class EditAddressScreen extends StatefulWidget {
  final Address address;

  const EditAddressScreen({Key? key, required this.address}) : super(key: key);

  @override
  _EditAddressScreenState createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController countryController;
  late TextEditingController stateController;
  late TextEditingController cityController;
  late TextEditingController streetAddressController;
  late TextEditingController zipCodeController;

  String? selectedState;
  String? selectedCity;

  final Map<String, List<String>> cities = {
    'Riyadh': ['Riyadh', 'Diriyah', 'Kharj'],
    'Qassim': ['Buraydah', 'Onaizah'],
    'Makkah': ['Makkah', 'Jeddah'],
  };

  final List<String> states = ['Riyadh', 'Qassim', 'Makkah'];

  @override
  void initState() {
    super.initState();
    countryController = TextEditingController(text: widget.address.country);
    stateController = TextEditingController(text: widget.address.state);
    cityController = TextEditingController(text: widget.address.city);
    streetAddressController =
        TextEditingController(text: widget.address.streetAddress);
    zipCodeController = TextEditingController(text: widget.address.zipCode);
  }

  @override
  void dispose() {
    countryController.dispose();
    stateController.dispose();
    cityController.dispose();
    streetAddressController.dispose();
    zipCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addressCubit = context.read<AddressCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarScreen(title: "Edit Address"),
      body: BlocListener<AddressCubit, AddressState>(
        listener: (context, state) {
          state.whenOrNull(
            addressUpdated: (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Address updated successfully')),
              );
              Navigator.pop(context);
            },
            error: (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(error)),
              );
            },
          );
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
                    SizedBox(height: 100),
                    Center(
                      child: MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final updatedAddress = UpdateAddress(
                              addressId: widget.address.addressId,
                              streetAddress: streetAddressController.text,
                              city: cityController.text,
                              state: stateController.text,
                              zipCode: zipCodeController.text,
                              country: countryController.text,
                            );
                            addressCubit.updateAddress(updatedAddress);
                            // Navigator.pop(context);
                            Navigator.pushReplacement<void, void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const SavedAddressScreen(),
                              ),
                            );
                          }
                        },
                        color: ColorsManager.mainGreen,
                        padding:
                            EdgeInsets.symmetric(horizontal: 90, vertical: 16),
                        child: Text(
                          'Save changes',
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
