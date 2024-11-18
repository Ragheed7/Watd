import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/di/dependency_injection.dart';
import 'package:waie/core/helpers/spacing.dart';
import 'package:waie/core/theming/colors.dart';
import 'package:waie/features/OnBoarding/welcome_screen.dart';
import 'package:waie/features/account/presentation/my_order_screen.dart';
import 'package:waie/features/account/presentation/myaccount.dart';
import 'package:waie/features/account/presentation/payment_screen.dart';
import 'package:waie/features/account/presentation/saved_address_screen.dart';
import 'package:waie/features/account/presentation/track_order_screen.dart';
import 'package:waie/features/account/presentation/widgets/account_header_widget.dart';
import 'package:waie/features/account/presentation/widgets/account_option_list_tile_screen.dart';
import 'package:waie/features/account/presentation/widgets/logout_button_widget.dart';
import 'package:waie/features/login/data/model/login_response.dart';
import 'package:waie/features/login/logic/cubit/login_cubit.dart';

class AccountScreen extends StatefulWidget {
  final UserData? userInfo;
  const AccountScreen({super.key, this.userInfo});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 64, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               AccountHeaderWidget(
                accountName: 'Account name',
                phoneNumber: widget.userInfo?.phone?? "0500000000",
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 8),
              const Text(
                'Account',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              AccountOptionListTileScreen(
                icon: Icons.person,
                title: 'My Account',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyaccountScreen(userInfo: widget.userInfo,),
                    ),
                  );
                },
              ),
              AccountOptionListTileScreen(
                icon: Icons.location_on,
                title: 'Saved address',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SavedAddressScreen(userInfo: widget.userInfo,),
                    ),
                  );
                },
              ),
              AccountOptionListTileScreen(
                icon: Icons.payment,
                title: 'Payment',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
              const Divider(),
              const SizedBox(height: 8),
              const Text(
                'Orders',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              AccountOptionListTileScreen(
                icon: Icons.inventory,
                title: 'My orders',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyOrderScreen(),
                    ),
                  );
                },
              ),
              AccountOptionListTileScreen(
                icon: Icons.local_shipping,
                title: 'Track order',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TrackOrderScreen(),
                    ),
                  );
                },
              ),
              AccountOptionListTileScreen(
                icon: Icons.reply,
                title: 'Return',
                onTap: () {},
              ),
              SizedBox(height: 130),
              LogoutButtonWidget(
                buttonText: 'Logout',
                buttonColor: const Color.fromRGBO(118, 192, 67, 1),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WelcomeScreen()),
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
