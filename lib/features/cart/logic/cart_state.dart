import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waie/core/shared_models/default_api_response.dart';
import 'package:waie/features/cart/data/model/get_cart_items.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading() = Loading;
  const factory CartState.itemAdded(DefaultApiResponse data) = ItemAdded;
  const factory CartState.itemRemoved(DefaultApiResponse data) = ItemRemoved;
  const factory CartState.cartItemsFetched(GetCartItems data) = CartItemsFetched;
  const factory CartState.success(DefaultApiResponse data) = Success;
  const factory CartState.error({required String error}) = Error;
  // const factory CartState.itemAlreadyExists({required String error}) = ItemAlreadyExists;
}
