import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/shared_models/user_addresses/logic/address_cubit.dart';
import 'package:waie/core/shared_models/user_addresses/logic/address_state.dart' as address_state;
import 'package:waie/features/account/presentation/widgets/add_new_address_button_screen.dart';
import 'package:waie/features/account/presentation/widgets/addreess_card_screen.dart';
import 'package:waie/features/account/presentation/widgets/app_bar_screen.dart';
import 'package:waie/core/shared_models/user_addresses/data/model/get_addresses.dart';
import 'package:waie/features/cart/data/model/selected_address_and_payment/selected_addresses_cubit.dart';

class SavedAddressScreen extends StatelessWidget {
  const SavedAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addressCubit = context.read<AddressCubit>()..getAddresses();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarScreen(title: "Saved Address"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 600,
              child: BlocBuilder<AddressCubit, address_state.AddressState<GetAddresses>>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => Center(child: CircularProgressIndicator()),
                    success: (getAddresses) {
                      final addresses = getAddresses.result ?? [];

                      if (addresses.isEmpty) {
                        return Center(child: Text('No saved addresses found.'));
                      }
                      return ListView.builder(
                        padding: EdgeInsets.all(20),
                        itemCount: addresses.length,
                        itemBuilder: (context, index) {
                          final address = addresses[index];
                          return GestureDetector(
                            onTap: () {
                              // Update the SelectedAddressCubit with the chosen address
                              context.read<SelectedAddressCubit>().selectAddress(address);
                              // Optionally, pop the screen to return to CheckOutScreen
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: AddressCardScreen(
                                address: address,
                                counter: index,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    addressCreated: (_) {
                      context.read<AddressCubit>().getAddresses();
                      return Center(child: CircularProgressIndicator());
                    },
                    error: (error) => Center(child: Text('Error: $error')),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: AddNewAddressButtonScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
