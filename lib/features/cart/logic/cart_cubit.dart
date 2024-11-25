import 'package:bloc/bloc.dart';
import 'package:waie/features/cart/data/model/add_to_cart_item_request.dart';
import 'package:waie/features/cart/data/model/remove_from_cart_item_request.dart';
import 'package:waie/features/cart/data/repository/cart_repo.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _cartRepo;

  CartCubit(this._cartRepo) : super(const CartState.initial());

  Future<void> addItemToCart(AddToCartItemRequest request) async {
    emit(const CartState.loading());

    final response = await _cartRepo.addItemToCart(request);

    response.when(
      success: (addToCartItemResponse) {
        if (addToCartItemResponse.isSuccess) {
          emit(CartState.itemAdded(addToCartItemResponse));
          fetchCartItems();
        } else {
          emit(CartState.error(
              error: addToCartItemResponse.message ?? "Failed to add item to cart"));
        }
      },
      failure: (error) {
        emit(CartState.error(
            error: error.apiErrorModel.message ?? "An error occurred"));
      },
    );
  }

  Future<void> removeItemFromCart(RemoveFromCartItemRequest request) async {
    emit(const CartState.loading());

    final response = await _cartRepo.removeItemFromCart(request);

    response.when(
      success: (removeFromCartItemResponse) {
        if (removeFromCartItemResponse.isSuccess) {
          emit(CartState.itemRemoved(removeFromCartItemResponse));
          fetchCartItems();
        } else {
          emit(CartState.error(
              error: removeFromCartItemResponse.message ?? "Failed to remove item from cart"));
        }
      },
      failure: (error) {
        emit(CartState.error(
            error: error.apiErrorModel.message ?? "An error occurred"));
      },
    );
  }

  Future<void> fetchCartItems() async {
    emit(const CartState.loading());

    final response = await _cartRepo.getCartItems();

    response.when(
      success: (getCartItems) {
        if (getCartItems.isSuccess == true) {
          emit(CartState.cartItemsFetched(getCartItems));
        } else {
          emit(CartState.error(
              error: getCartItems.message ?? "Failed to fetch cart items"));
        }
      },
      failure: (error) {
        emit(CartState.error(
            error: error.apiErrorModel.message ?? "An error occurred"));
      },
    );
  }
}
