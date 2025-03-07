import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:watd/core/theming/colors.dart';
import 'package:watd/features/account/presentation/widgets/app_bar_screen.dart';
import 'package:watd/features/cart/logic/cart_cubit.dart';
import 'package:watd/features/cart/logic/cart_state.dart';
import 'package:watd/features/cart/presentation/widgets/cart_item_screen.dart';
import 'package:watd/features/cart/presentation/widgets/cart_summary_screen.dart';
import 'package:watd/features/cart/presentation/widgets/checkout_button_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Timer? _timer;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    // Fetch cart items when the screen is initialized
    context.read<CartCubit>().fetchCartItems();

  //  WidgetsBinding.instance.addPostFrameCallback((_) {
  //     _refreshIndicatorKey.currentState?.show();
  //     context.read<CartCubit>().fetchCartItems();
  //   });

    // Timer to fetch cart items every 30 seconds
    // _timer = Timer.periodic(Duration(seconds: 30), (timer) {
      // _refreshIndicatorKey.currentState?.show();
    //   context.read<CartCubit>().fetchCartItems();
    // },
    // );
  }

  // @override
  // void dispose() {
  //   // Cancel the timer when the widget is disposed
  //   _timer?.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarScreen(title: 'Cart'),
      body: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          // Listen for error states to show SnackBars or other notifications
          state.maybeWhen(
            error: (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(error)),
              );
            },
            itemAdded: (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Item added to cart successfully")),
              );
            },
            itemRemoved: (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Item removed from cart")),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => Center(child: Text("Initializing Cart...")),
            loading: () => Center(
                child: CircularProgressIndicator(
              color: ColorsManager.mainGreen,
            )),
            cartItemsFetched: (data) {
              final cartItems = data.result ?? [];
              if (cartItems.isEmpty) {
                return Center(
                    child: Image.asset(
                  "assets/images/EC.png",
                  width: 150,
                  height: 200,
                ));
              }

              // Calculate total
              double total = 0;
              for (var item in cartItems) {
                if (item?.price != null) {
                  total += item!.price!;
                }
              }

              return RefreshIndicator(
                // key: _refreshIndicatorKey,
                color: ColorsManager.mainGreen,
                backgroundColor: Colors.white,
                onRefresh: () async {
                  await context.read<CartCubit>().fetchCartItems();
                },
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    CartSummaryScreen(
                      itemCount: cartItems.length,
                      totalPrice: total,
                    ),
                    SizedBox(height: 15),
                    // Cart items
                    ...cartItems.map((product) {
                      return CartItemScreen(
                        product: product,
                        showDeleteButton: true,
                      );
                    }).toList(),
                    SizedBox(height: 100),
                    CheckoutButtonScreen(),
                    SizedBox(height: 20),
                  ],
                ),
              );
            },
            error: (error) => Center(child: Text(error)),
            itemAdded: (_) => Container(),
            itemRemoved: (_) => Container(),
            success: (_) => Container(),
          );
        },
      ),
    );
  }
}
