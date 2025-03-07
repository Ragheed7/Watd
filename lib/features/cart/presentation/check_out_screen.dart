import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watd/core/helpers/constants.dart';
import 'package:watd/core/shared_models/user_addresses/data/model/get_addresses.dart';
import 'package:watd/core/theming/colors.dart';
import 'package:watd/features/cart/data/model/order_models/create_order_request.dart';
import 'package:watd/features/cart/data/model/order_models/pay_order_request.dart';
import 'package:watd/features/cart/data/model/selected_address_and_payment/selected_addresses_cubit.dart';
import 'package:watd/features/cart/data/model/selected_address_and_payment/selected_payment_card_cubit.dart';
import 'package:watd/features/cart/logic/cart_cubit.dart';
import 'package:watd/features/cart/logic/cart_state.dart' as cart_state;
import 'package:watd/core/shared_models/user_addresses/logic/address_state.dart'
    as address_state;
import 'package:watd/features/cart/logic/order%20logic/create_order_cubit.dart';
import 'package:watd/features/cart/logic/order%20logic/create_order_state.dart';
import 'package:watd/features/cart/logic/order%20logic/pay_order_cubit.dart';
import 'package:watd/features/cart/logic/order%20logic/pay_order_state.dart';
import 'package:watd/features/cart/presentation/widgets/order_summary_screen.dart';
import 'package:watd/features/cart/presentation/widgets/payment_section_screen.dart';
import 'package:watd/features/cart/presentation/widgets/delivery_address_section_screen.dart';
import 'package:watd/features/cart/presentation/widgets/cart_section_screen.dart';
import 'package:watd/features/account/presentation/widgets/app_bar_screen.dart';
import 'package:watd/features/account/presentation/saved_address_screen.dart';
import 'package:watd/features/account/presentation/payment_screen.dart';
import 'package:watd/features/cart/presentation/widgets/payment_success_screen.dart';
import 'package:watd/features/login/logic/cubit/user_cubit.dart';
import 'package:watd/features/products_list/logic/cubit/product_cubit.dart';
import 'package:watd/features/search/presentation/search_screen.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  String _cvv = '';
  final _formKey = GlobalKey<FormState>();

  void _handleCvvChange(String cvv) {
    setState(() {
      _cvv = cvv;
    });
  }

  void _processOrderCreation() async {
    // Validate selected address
    final selectedAddressState = context.read<SelectedAddressCubit>().state;
    if (selectedAddressState is! address_state.Success<Address>) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select a delivery address.")),
      );
      return;
    }

    // Validate selected payment card
    final selectedPaymentCardState =
        context.read<SelectedPaymentCardCubit>().state;
    if (selectedPaymentCardState is! PaymentCardSelected) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select a payment method.")),
      );
      return;
    }

    // Validate CVV
    if (_cvv.isEmpty || !RegExp(r'^\d{3,4}$').hasMatch(_cvv)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a valid CVV.")),
      );
      return;
    }

    // Validate cart items
    final cartItems = context.read<CartCubit>().currentCartItems;
    if (cartItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Your cart is empty.")),
      );
      return;
    }

    // Proceed to create order
    await _createOrder();
  }

  Future<void> _createOrder() async {
    final createOrderCubit = context.read<CreateOrderCubit>();
    final selectedAddressState = context.read<SelectedAddressCubit>().state;
    final shippingAddressId =
        (selectedAddressState as address_state.Success<Address>).data.addressId;

    final createOrderRequest = CreateOrderRequest(
      shippingAddressId: shippingAddressId,
    );

    // Dispatch CreateOrder
    createOrderCubit.createOrder(createOrderRequest);
  }

  Future<void> _payForOrder(int orderId) async {
    final payOrderCubit = context.read<PayOrderCubit>();
    final selectedPaymentCardState =
        context.read<SelectedPaymentCardCubit>().state;
    final selectedCard =
        (selectedPaymentCardState as PaymentCardSelected).selectedCard;

    // Remove all spaces from the card number
    String sanitizedCardNumber = selectedCard.cardNumber.replaceAll(' ', '');

    // Validate the sanitized card number
    if (sanitizedCardNumber.length != 16 ||
        !RegExp(r'^\d{16}$').hasMatch(sanitizedCardNumber)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text("Please enter a valid 16-digit credit card number.")),
      );
      return;
    }

    String formattedDate =
        "${selectedCard.expiryYear.toString().padLeft(4, '0')}-${selectedCard.expiryMonth.toString().padLeft(2, '0')}-01";

    final payOrderRequest = PayOrderRequest(
      creditCardNumber: sanitizedCardNumber,
      cardholderName: selectedCard.cardHolderName,
      expirationDate: formattedDate,
      cvv: _cvv,
    );

    // Dispatch PayOrder
    payOrderCubit.payOrder(orderId, payOrderRequest);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarScreen(title: 'Checkout'),
      body: MultiBlocListener(
        listeners: [
          // Listener for CreateOrderCubit
          BlocListener<CreateOrderCubit, CreateOrderState>(
            listener: (context, state) async {
              state.when(
                initial: () {},
                loading: () {
                  // Show loading indicator
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => Center(
                        child: CircularProgressIndicator(
                      color: ColorsManager.mainGreen,
                    )),
                  );
                },
                success: (createOrderResponse) async {
                  Navigator.of(context).pop(); // Remove loading dialog
                  if (createOrderResponse.isSuccess) {
                    final orderId = createOrderResponse.result.orderId;
                    // Proceed to pay for the order
                    await _payForOrder(orderId);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(createOrderResponse.message ??
                              "Unable to create your order at the moment. Please try again later.")),
                    );
                  }
                },
                failure: (error) {
                  Navigator.of(context).pop(); // Remove loading dialog
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(error)),
                  );
                },
              );
            },
          ),
          // Listener for PayOrderCubit
          BlocListener<PayOrderCubit, PayOrderState>(
            listener: (context, state) {
              state.when(
                initial: () {},
                loading: () {
                  // Show loading indicator
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => Center(
                        child: CircularProgressIndicator(
                      color: ColorsManager.mainGreen,
                    )),
                  );
                },
                success: (payOrderResponse) {
                  Navigator.of(context).pop(); // Remove loading dialog
                  if (payOrderResponse.isSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Payment Successful!")),
                    );

                    // Clear the cart upon successful payment
                    // context.read<CartCubit>().clearCart();

                    // Refresh the ProductCubit to update the search page
                    context.read<ProductCubit>().getProducts(
                          isInitialLoad: true,
                          // categoryId: 
                          // context
                          //     .read<SearchScreen>()
                          //     .categoryData
                          //     ?.categoryId,
                        );

                    // Navigate to Payment Success Screen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentSuccessScreen(
                          orderId: payOrderResponse.result.orderId,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(payOrderResponse.message ??
                              "Payment unsuccessful. You can find your created order in My Order Page.")),
                    );
                  }
                },
                failure: (error) {
                  Navigator.of(context).pop(); // Remove loading dialog
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(error)),
                  );
                },
              );
            },
          ),
        ],
        child: BlocBuilder<CartCubit, cart_state.CartState>(
          builder: (context, state) {
            return state.when(
              initial: () => Center(child: Text("Initializing Checkout...")),
              loading: () => Center(
                  child: CircularProgressIndicator(
                color: ColorsManager.mainGreen,
              )),
              cartItemsFetched: (data) {
                final cartItems = data.result ?? [];
                if (cartItems.isEmpty) {
                  return Center(child: Text("Your cart is empty"));
                }
                // Calculate totals
                double itemsTotal = 0;
                for (var item in cartItems) {
                  if (item.price != null) {
                    itemsTotal += item.price!;
                  }
                }
                double totalPayment = itemsTotal + SharedPrefKeys.deliveryFee;

                return RefreshIndicator(
                  color: ColorsManager.mainGreen,
                  backgroundColor: Colors.white,
                  onRefresh: () async {
                    await context.read<CartCubit>().fetchCartItems();
                  },
                  child: SingleChildScrollView(
                    child: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Cart Items Section
                              CartSectionScreen(cartItems: cartItems),
                              SizedBox(height: 50),
                              // Delivery Address
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Delivery Address",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      // Navigate to Change Address Screen and await selection
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              SavedAddressScreen(),
                                        ),
                                      );
                                      // The SelectedAddressCubit will handle the selection
                                    },
                                    child: Text(
                                      "Change",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: ColorsManager.mainGreen,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              // Display Selected Address
                              BlocBuilder<SelectedAddressCubit,
                                  address_state.AddressState<Address>>(
                                builder: (context, state) {
                                  if (state is address_state.Success<Address>) {
                                    return DeliveryAddressSectionScreen(
                                        address: state.data);
                                  } else {
                                    return Center(
                                        child: Text("No address selected"));
                                  }
                                },
                              ),
                              SizedBox(height: 15),
                              // Payment Section
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Payment",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      // Retrieve userId from UserCubit
                                      final userCubit =
                                          context.read<UserCubit>();
                                      final userId = userCubit.state?.userId;

                                      if (userId == null || userId.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              content:
                                                  Text("User not logged in.")),
                                        );
                                        return;
                                      }

                                      // Navigate to PaymentScreen with userId
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PaymentScreen(
                                            isSelection: true,
                                            userId: userId,
                                          ),
                                        ),
                                      );
                                      // The SelectedPaymentCardCubit will handle the selection
                                    },
                                    child: Text(
                                      "Change",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: ColorsManager.mainGreen,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              // Display Selected Payment Card
                              BlocBuilder<SelectedPaymentCardCubit,
                                  PaymentCardState>(
                                builder: (context, state) {
                                  if (state is PaymentCardSelected) {
                                    return PaymentSectionScreen(
                                      paymentCard: state.selectedCard,
                                      onCvvChanged: _handleCvvChange,
                                    );
                                  } else {
                                    return Center(
                                        child:
                                            Text("No payment card selected"));
                                  }
                                },
                              ),
                              SizedBox(height: 40),
                              // Order Summary
                              OrderSummaryScreen(
                                itemsTotal: itemsTotal,
                                deliveryFee: SharedPrefKeys.deliveryFee,
                                totalPayment: totalPayment,
                              ),
                              SizedBox(height: 20),
                              // Buy Button
                              Center(
                                child: ElevatedButton(
                                  onPressed: (_cvv.isNotEmpty &&
                                          RegExp(r'^\d{3,4}$').hasMatch(_cvv))
                                      ? () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                backgroundColor: Colors.white,
                                                title: Text('Confirm Purchase'),
                                                content: Text(
                                                    'Are you sure you want to proceed with this purchase?'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                      _processOrderCreation();
                                                    },
                                                    child: Text(
                                                      'Confirm',
                                                      style: TextStyle(
                                                          color: ColorsManager
                                                              .mainGreen),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      : null,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: ColorsManager.mainGreen,
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.3,
                                      vertical: 16,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                  child: Text(
                                    'Buy',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 100),
                            ],
                          ),
                        ),
                      ),
                    ),
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
      ),
    );
  }
}
