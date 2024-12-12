// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:waie/features/cart/data/repository/order_repo.dart';
// import 'package:waie/features/cart/logic/order%20logic/get_orders_cubit.dart';
// import 'package:waie/features/cart/logic/order%20logic/get_orders_state.dart';
// import 'package:waie/features/cart/presentation/widgets/cart_item_screen.dart';
// import 'package:waie/features/cart/presentation/widgets/order_summary_screen.dart';

// class OrderSectionScreen extends StatelessWidget {
//   final int orderId;

//   const OrderSectionScreen({Key? key, required this.orderId}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Fetch order details using a cubit or repository
//     return BlocProvider(
//       create: (_) => GetOrdersCubit()..fetchOrders(),
//       child: BlocBuilder<GetOrdersCubit, GetOrdersState>(
//         builder: (context, state) {
//           return state.when(
//             initial: () => Center(child: Text("Loading order details...")),
//             loading: () => Center(child: CircularProgressIndicator()),
//             success: (order) {
//               // Calculate totals
//               double itemsTotal = 0;
//               for (var item in order.orderItems) {
//                 if (item.product.price != null) {
//                   itemsTotal += item.product.price!;
//                 }
//               }
//               double deliveryFee = SharedPrefKeys.deliveryFee;
//               double totalPayment = itemsTotal + deliveryFee;

//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Display Order Items
//                   ListView.builder(
//                     itemCount: order.orderItems.length,
//                     physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemBuilder: (context, index) {
//                       final product = order.orderItems[index].product;
//                       return CartItemScreen(product: product);
//                     },
//                   ),
//                   SizedBox(height: 20),
//                   // Order Summary
//                   OrderSummaryScreen(
//                     itemsTotal: itemsTotal,
//                     deliveryFee: deliveryFee,
//                     totalPayment: totalPayment,
//                   ),
//                 ],
//               );
//             },
//             failure: (error) => Center(child: Text(error)),
//           );
//         },
//       ),
//     );
//   }
// }
