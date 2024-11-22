import 'package:flutter/material.dart';
import 'package:waie/core/shared_models/user_addresses/logic/address_cubit.dart';
import 'package:waie/core/shared_models/user_addresses/logic/address_state.dart';
import 'package:waie/features/account/presentation/widgets/add_new_address_button_screen.dart';
import 'package:waie/features/account/presentation/widgets/addreess_card_screen.dart';
import 'package:waie/features/account/presentation/widgets/app_bar_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              child: BlocBuilder<AddressCubit, AddressState>(
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
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: AddressCardScreen(address: address, counter: index,),
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
