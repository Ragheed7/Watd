import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waie/features/cart/data/model/get_cart_items.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState<T> with _$CartState<T> {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading() = Loading;
  const factory CartState.itemAdded(T data) = ItemAdded<T>;
  const factory CartState.itemRemoved(T data) = ItemRemoved<T>;
  const factory CartState.cartItemsFetched(GetCartItems data) = CartItemsFetched;
  const factory CartState.success(T data) = Success<T>;
  const factory CartState.error({required String error}) = Error;
}
