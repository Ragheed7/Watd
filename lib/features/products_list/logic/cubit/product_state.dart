import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waie/core/networking/api_error_handler.dart';
import 'package:waie/features/products_list/data/model/product_response.dart';

part 'product_state.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;

  // product 
  const factory ProductState.productLoading() = ProductLoading;
  const factory ProductState.productSuccess(List<Product?>? product) = ProductSuccess;
  const factory ProductState.productError(ErrorHandler errorHandler) = ProductError;
}
