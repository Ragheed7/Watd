import 'package:bloc/bloc.dart';
import 'package:waie/features/products_list/data/model/product_response.dart';
import 'package:waie/features/products_list/data/repository/product_repo.dart';
import 'package:waie/features/products_list/logic/cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._productRepo) : super(const ProductState.initial());
  final ProductRepo _productRepo;

  List<Product?>? productsList = [];

  void getProducts() async {
    emit(const ProductState.productLoading());
    final response = await _productRepo.getProduct();
    response.when(
      success: (productResponse) {
        productsList = productResponse.result ?? [];
        print('Fetched Products: ${productsList?.length}');
        emit(ProductState.productSuccess(productResponse.result));
      },
      failure: (errorHandler) {
        emit(ProductState.productError(errorHandler));
      },
    );
  }
}
